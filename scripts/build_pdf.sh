#!/bin/bash
# Build PDF books from markdown chapters using md-to-pdf (Node.js)
# Usage: bash scripts/build_pdf.sh ko  OR  bash scripts/build_pdf.sh en

LANG=${1:-ko}
BOOK_DIR="book/${LANG}"
OUTPUT="book/${LANG}/tactile_book_${LANG}.pdf"
COMBINED="book/${LANG}/_combined.md"

echo "=== Building ${LANG^^} PDF ==="

# Combine all chapters into one markdown file
{
  # Cover page
  if [ "$LANG" = "ko" ]; then
    echo "# Tactile Sensing for Robot Hands"
    echo ""
    echo "## 촉각 센서부터 지능형 조작까지"
    echo ""
    echo "**2026년 4월**"
  else
    echo "# Tactile Sensing for Robot Hands"
    echo ""
    echo "## From Tactile Sensors to Intelligent Manipulation"
    echo ""
    echo "**April 2026**"
  fi
  echo ""
  echo "---"
  echo ""

  # TOC
  if [ -f "${BOOK_DIR}/toc.md" ]; then
    cat "${BOOK_DIR}/toc.md"
    echo ""
    echo "---"
    echo ""
  fi

  # Chapters
  for ch in $(ls ${BOOK_DIR}/ch*.md 2>/dev/null | sort); do
    # Strip YAML frontmatter
    awk 'BEGIN{skip=0} /^---$/{skip++; if(skip<=2) next} skip>=2{print}' "$ch"
    echo ""
    echo "---"
    echo ""
  done

  # Glossary
  if [ -f "${BOOK_DIR}/glossary.md" ]; then
    cat "${BOOK_DIR}/glossary.md"
  fi
} > "$COMBINED"

echo "  Combined: $(wc -l < "$COMBINED") lines"

# Convert to PDF using md-to-pdf
npx --yes md-to-pdf "$COMBINED" \
  --pdf-options '{"format":"A4","margin":{"top":"25mm","bottom":"25mm","left":"20mm","right":"20mm"}}' \
  --css 'body{font-family:"Noto Sans KR",Inter,sans-serif;font-size:11pt;line-height:1.7;color:#1a1a1a}h1{font-size:22pt;font-weight:900;color:#0a0a2e;border-bottom:3px solid #00D4AA;padding-bottom:8px;page-break-before:always}h1:first-of-type{page-break-before:avoid}h2{font-size:16pt;font-weight:700;color:#1a1a4e;border-bottom:1px solid #ddd}h3{font-size:13pt;font-weight:500}blockquote{background:#f0f7ff;border-left:4px solid #3498DB;padding:12px 16px;margin:16px 0}table{width:100%;border-collapse:collapse;font-size:9.5pt}th{background:#2c3e50;color:white;padding:8px 12px;text-align:left}td{padding:6px 12px;border-bottom:1px solid #ddd}tr:nth-child(even){background:#f8f9fa}code{background:#f4f4f4;padding:2px 6px;border-radius:3px;font-size:9.5pt}pre{background:#1e1e2e;color:#cdd6f4;padding:16px;border-radius:8px;font-size:9pt}hr{border:none;border-top:1px solid #ddd;margin:2em 0}img{max-width:100%}'

# md-to-pdf outputs to same dir with .pdf extension
GENERATED="${COMBINED%.md}.pdf"
if [ -f "$GENERATED" ]; then
  mv "$GENERATED" "$OUTPUT"
  rm -f "$COMBINED"
  SIZE=$(du -h "$OUTPUT" | cut -f1)
  echo "  Done! ${OUTPUT} (${SIZE})"
else
  echo "  ERROR: PDF not generated"
  rm -f "$COMBINED"
  exit 1
fi
