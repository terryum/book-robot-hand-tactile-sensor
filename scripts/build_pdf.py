#!/usr/bin/env python3
"""Build PDF books from markdown chapters using weasyprint.

Usage:
    python3 scripts/build_pdf.py --lang ko --output book/ko/tactile_book_ko.pdf
    python3 scripts/build_pdf.py --lang en --output book/en/tactile_book_en.pdf
"""

import argparse
import markdown
from pathlib import Path
from weasyprint import HTML


def build_pdf(lang: str, output_path: str):
    book_dir = Path(f"book/{lang}")
    chapters = sorted(book_dir.glob("ch*.md"), key=lambda p: p.name)

    if not chapters:
        print(f"ERROR: No chapters found in {book_dir}")
        return

    # Read TOC
    toc_path = book_dir / "toc.md"
    toc_content = toc_path.read_text(encoding="utf-8") if toc_path.exists() else ""

    # Read glossary
    glossary_path = book_dir / "glossary.md"
    glossary_content = glossary_path.read_text(encoding="utf-8") if glossary_path.exists() else ""

    # Combine all chapters
    all_md = []
    if toc_content:
        all_md.append(toc_content)
        all_md.append("\n\n---\n\n")

    for ch_path in chapters:
        content = ch_path.read_text(encoding="utf-8")
        # Strip YAML frontmatter
        if content.startswith("---"):
            end = content.find("---", 3)
            if end != -1:
                content = content[end + 3:].strip()
        all_md.append(content)
        all_md.append("\n\n---\n\n")

    if glossary_content:
        all_md.append("# Glossary\n\n" if lang == "en" else "# 용어집\n\n")
        all_md.append(glossary_content)

    full_md = "\n".join(all_md)

    # Convert markdown to HTML
    extensions = ["tables", "fenced_code", "toc", "attr_list"]
    html_body = markdown.markdown(full_md, extensions=extensions)

    # Title based on language
    if lang == "ko":
        title = "Tactile Sensing for Robot Hands — 촉각 센서부터 지능형 조작까지"
        font_family = "'Noto Sans KR', sans-serif"
    else:
        title = "Tactile Sensing for Robot Hands — From Tactile Sensors to Intelligent Manipulation"
        font_family = "'Inter', 'Noto Sans KR', sans-serif"

    # Build full HTML with styling
    full_html = f"""<!DOCTYPE html>
<html lang="{lang}">
<head>
<meta charset="utf-8">
<title>{title}</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&family=Inter:wght@300;400;500;700&display=swap');

@page {{
    size: A4;
    margin: 2.5cm 2cm;
    @top-center {{
        content: "{title}";
        font-size: 8pt;
        color: #999;
    }}
    @bottom-center {{
        content: counter(page);
        font-size: 9pt;
    }}
}}

@page :first {{
    @top-center {{ content: none; }}
}}

body {{
    font-family: {font_family};
    font-size: 11pt;
    line-height: 1.7;
    color: #1a1a1a;
    max-width: 100%;
}}

h1 {{
    font-size: 22pt;
    font-weight: 900;
    color: #0a0a2e;
    margin-top: 2em;
    padding-bottom: 0.3em;
    border-bottom: 3px solid #00D4AA;
    page-break-before: always;
}}

h1:first-of-type {{
    page-break-before: avoid;
}}

h2 {{
    font-size: 16pt;
    font-weight: 700;
    color: #1a1a4e;
    margin-top: 1.5em;
    border-bottom: 1px solid #ddd;
    padding-bottom: 0.2em;
}}

h3 {{
    font-size: 13pt;
    font-weight: 500;
    color: #333;
    margin-top: 1.2em;
}}

p {{
    text-align: justify;
    orphans: 3;
    widows: 3;
}}

blockquote {{
    background: #f0f7ff;
    border-left: 4px solid #3498DB;
    padding: 0.8em 1.2em;
    margin: 1em 0;
    font-size: 10pt;
}}

table {{
    width: 100%;
    border-collapse: collapse;
    margin: 1em 0;
    font-size: 9.5pt;
}}

th {{
    background: #2c3e50;
    color: white;
    padding: 8px 12px;
    text-align: left;
    font-weight: 500;
}}

td {{
    padding: 6px 12px;
    border-bottom: 1px solid #ddd;
}}

tr:nth-child(even) {{
    background: #f8f9fa;
}}

code {{
    background: #f4f4f4;
    padding: 2px 6px;
    border-radius: 3px;
    font-size: 9.5pt;
    font-family: 'SF Mono', 'Consolas', monospace;
}}

pre {{
    background: #1e1e2e;
    color: #cdd6f4;
    padding: 1em;
    border-radius: 8px;
    overflow-x: auto;
    font-size: 9pt;
    line-height: 1.4;
}}

pre code {{
    background: none;
    padding: 0;
    color: inherit;
}}

img {{
    max-width: 100%;
    height: auto;
    display: block;
    margin: 1em auto;
}}

figure {{
    text-align: center;
    margin: 1.5em 0;
}}

figcaption {{
    font-size: 9pt;
    color: #666;
    margin-top: 0.5em;
}}

hr {{
    border: none;
    border-top: 1px solid #ddd;
    margin: 2em 0;
}}

/* Cover page */
.cover {{
    text-align: center;
    padding-top: 30%;
}}

.cover h1 {{
    font-size: 28pt;
    border: none;
    color: #0a0a2e;
    page-break-before: avoid;
}}

.cover .subtitle {{
    font-size: 14pt;
    color: #666;
    margin-top: 1em;
}}

.cover .date {{
    font-size: 11pt;
    color: #999;
    margin-top: 3em;
}}
</style>
</head>
<body>

<div class="cover">
<h1>Tactile Sensing for<br>Robot Hands</h1>
<p class="subtitle">{"촉각 센서부터 지능형 조작까지" if lang == "ko" else "From Tactile Sensors to Intelligent Manipulation"}</p>
<p class="date">{"2026년 4월" if lang == "ko" else "April 2026"}</p>
</div>

{html_body}

</body>
</html>"""

    # Generate PDF
    output = Path(output_path)
    output.parent.mkdir(parents=True, exist_ok=True)

    print(f"Generating {lang.upper()} PDF...")
    print(f"  Chapters: {len(chapters)}")
    print(f"  Output: {output_path}")

    HTML(string=full_html, base_url=str(Path.cwd())).write_pdf(str(output))
    print(f"  Done! Size: {output.stat().st_size / 1024:.0f} KB")


def main():
    parser = argparse.ArgumentParser(description="Build book PDF from markdown")
    parser.add_argument("--lang", required=True, choices=["ko", "en"])
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    build_pdf(args.lang, args.output)


if __name__ == "__main__":
    main()
