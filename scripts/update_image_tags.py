#!/usr/bin/env python3
"""Replace <!-- IMAGE: ... --> tags with actual image references in chapter markdown files."""
import re
from pathlib import Path

BASE = Path("/Users/terrytaewoongum/Codes/personal/book-tactile-hand-harness-auto")

# Map: (chapter, figure_num) -> (file_basename, caption_ko, caption_en, source_note)
FIGURES = {
    # Ch03
    (3, 1): ("fig_3_1_albini_taxonomy",
             "Albini et al.의 촉각 데이터 표현 분류 체계. Source: Albini et al. (2025).",
             "Albini et al.'s taxonomy of tactile data representations. Source: Albini et al. (2025)."),
    (3, 2): ("fig_3_2_representation_comparison",
             "6가지 촉각 데이터 표현 구조의 비교.",
             "Comparison of six tactile data representation structures."),
    (3, 3): ("fig_3_3_sensor_agnostic",
             "센서 무관 촉각 표현의 세 가지 접근 — AnyTouch, Sensor-Invariant, Canonical 3D.",
             "Three approaches to sensor-agnostic tactile representations — AnyTouch, Sensor-Invariant, Canonical 3D."),
    (3, 4): ("fig_3_4_collection_pipelines",
             "촉각 데이터 수집 파이프라인 비교.",
             "Comparison of tactile data collection pipelines."),
    (3, 5): ("fig_3_5_dataset_comparison",
             "주요 촉각 데이터셋의 규모와 모달리티 비교.",
             "Scale and modality comparison of major tactile datasets."),
    (3, 6): ("fig_3_6_foundation_models",
             "촉각 Foundation Model의 구조 — Sparsh(자기지도)와 UniTouch(대조 학습)의 비교.",
             "Tactile foundation model architectures — Sparsh (self-supervised) vs. UniTouch (contrastive learning)."),
    # Ch04
    (4, 1): ("fig_4_1_gripper_spectrum",
             "병렬 그리퍼 vs 다지 핸드 — 설계 트레이드오프 스펙트럼.",
             "Parallel gripper vs. dexterous hand — the design trade-off spectrum."),
    (4, 2): ("fig_4_2_hand_cost_performance",
             "오픈소스 로봇 핸드의 비용-성능 비교.",
             "Cost-performance comparison of open-source robot hands."),
    (4, 3): ("fig_4_3_tendon_hands",
             "건 구동 핸드의 구조 — SoftHand, ORCA, CRAFT의 건 경로 비교.",
             "Tendon-driven hand architectures — tendon routing comparison of SoftHand, ORCA, CRAFT."),
    (4, 4): ("fig_4_4_design_axes",
             "로봇 핸드 설계의 4가지 핵심 축 — DoF, 구동, 유연성, 비용의 관계.",
             "Four axes of robot hand design — relationships among DoF, actuation, compliance, and cost."),
    (4, 5): ("fig_4_5_sensor_integration",
             "센서 통합 핸드 설계 — F-TAC Hand와 ORCA의 센서 배치 전략 비교. Source: F-TAC Hand (2025), ORCA (2025).",
             "Sensor-integrated hand designs — sensor placement strategies. Source: F-TAC Hand (2025), ORCA (2025)."),
    (4, 6): ("fig_4_6_allegro_ecosystem",
             "Allegro Hand 기반 연구 생태계.",
             "Allegro Hand-based research ecosystem."),
    # Ch05
    (5, 1): ("fig_5_1_underactuation",
             "부족 구동 손가락의 형상 적응 시퀀스.",
             "Shape adaptation sequence of an underactuated finger."),
    (5, 2): ("fig_5_2_variable_stiffness",
             "네 가지 가변 강성 구동기 구현 방식.",
             "Four VSA implementation approaches."),
    (5, 3): ("fig_5_3_active_belt",
             "능동 표면(Active Belt)의 작동 원리.",
             "Active belt surface operating principle."),
    (5, 4): ("fig_5_4_integrated_architecture",
             "세 메커니즘의 통합 아키텍처.",
             "Integrated architecture of three mechanisms."),
    (5, 5): ("fig_5_5_factory_tasks",
             "공장 자동화 Target Tasks.",
             "Factory automation target tasks."),
    (5, 6): ("fig_5_6_contact_continuity",
             "연속 접촉 vs 불연속 접촉 — 상태 전환 다이어그램.",
             "Continuous vs. discrete contact — state transition diagrams."),
    # Ch06
    (6, 1): ("fig_6_1_mano_model",
             "MANO 손 모델. Source: Romero et al. (2017).",
             "MANO hand model. Source: Romero et al. (2017)."),
    (6, 2): ("fig_6_2_tracking_gloves",
             "모션 트래킹 글로브 비교.",
             "Motion tracking glove comparison."),
    (6, 3): ("fig_6_3_osmo_bridge",
             "OSMO 글로브의 Embodiment Bridge 개념. Source: OSMO (2025).",
             "OSMO glove's Embodiment Bridge concept. Source: OSMO (2025)."),
    (6, 4): ("fig_6_4_dexumi",
             "DexUMI의 이중 격차 해소. Source: DexUMI (2025).",
             "DexUMI's dual gap resolution. Source: DexUMI (2025)."),
    (6, 5): ("fig_6_5_collection_spectrum",
             "인간 손 데이터 수집 방법의 스펙트럼.",
             "Spectrum of human hand data collection methods."),
    (6, 6): ("fig_6_6_teleop_comparison",
             "원격 조작 시스템 비교.",
             "Teleoperation system comparison."),
    # Ch07
    (7, 1): ("fig_7_1_diffusion_vs_act",
             "Diffusion Policy vs ACT/ALOHA — 모방 학습의 두 주류 접근 비교.",
             "Diffusion Policy vs. ACT/ALOHA — comparing the two dominant IL approaches."),
    (7, 2): ("fig_7_2_tactile_rl_pipeline",
             "촉각 기반 강화학습 파이프라인.",
             "Tactile RL pipeline."),
    (7, 3): ("fig_7_3_pptac",
             "PP-Tac 시스템. Source: PP-Tac (RSS 2025).",
             "PP-Tac system. Source: PP-Tac (RSS 2025)."),
    (7, 4): ("fig_7_4_force_learning",
             "힘 기반 학습의 두 접근 — DexForce와 ForceVLA 비교.",
             "Two force-informed learning approaches — DexForce vs. ForceVLA."),
    (7, 5): ("fig_7_5_il_rl_optimization",
             "IL vs RL vs 최적화 — 세 방법론의 적용 영역과 트레이드오프.",
             "IL vs. RL vs. Optimization — application domains and trade-offs."),
    (7, 6): ("fig_7_6_tactile_landscape",
             "촉각 기반 조작 학습의 전체 지형도.",
             "Full landscape of tactile manipulation learning."),
    # Ch08
    (8, 1): ("fig_8_1_vla_timeline",
             "VLA 계보 타임라인.",
             "VLA model evolution timeline."),
    (8, 2): ("fig_8_2_pi0_architecture",
             "pi0 아키텍처. Source: pi0 (2024).",
             "pi0 architecture. Source: pi0 (2024)."),
    (8, 3): ("fig_8_3_tactile_vla_approaches",
             "VLA에 촉각을 통합하는 세 가지 접근.",
             "Three approaches to integrating tactile sensing with VLA models."),
    (8, 4): ("fig_8_4_open_x_embodiment",
             "Open X-Embodiment의 교차 체현 데이터 전략.",
             "Open X-Embodiment cross-embodiment data strategy."),
    (8, 5): ("fig_8_5_vla_comparison",
             "VLA 모델의 아키텍처 비교.",
             "VLA model architecture comparison."),
    (8, 6): ("fig_8_6_vla_ecosystem",
             "VLA 생태계 전체 지도.",
             "VLA ecosystem map."),
    # Ch09
    (9, 1): ("fig_9_1_sim_engines",
             "촉각 시뮬레이션 엔진 비교.",
             "Tactile simulation engine comparison."),
    (9, 2): ("fig_9_2_dextreme_adr",
             "DeXtreme의 ADR. Source: DeXtreme (ICRA 2023).",
             "DeXtreme ADR pipeline. Source: DeXtreme (ICRA 2023)."),
    (9, 3): ("fig_9_3_tactile_sim2real_challenges",
             "촉각 sim-to-real의 도전.",
             "Challenges of tactile sim-to-real transfer."),
    (9, 4): ("fig_9_4_exostart_pipeline",
             "Real-Sim-Real 루프 — ExoStart의 파이프라인. Source: ExoStart (2025).",
             "ExoStart Real-Sim-Real loop pipeline. Source: ExoStart (2025)."),
    (9, 5): ("fig_9_5_gap_sources",
             "Sim-to-Real 격차의 세 근원.",
             "Three sources of the sim-to-real gap."),
    (9, 6): ("fig_9_6_synthetic_data",
             "합성 데이터의 위력과 한계.",
             "Synthetic data: power and limitations."),
    # Ch10
    (10, 1): ("fig_10_1_three_gaps",
              "교차 체현 격차의 세 차원.",
              "Three dimensions of the cross-embodiment gap."),
    (10, 2): ("fig_10_2_kinematic_retargeting",
              "운동학적 리타게팅의 세 접근.",
              "Three kinematic retargeting approaches."),
    (10, 3): ("fig_10_3_visual_gap",
              "시각적 격차 해소 — DexUMI와 RoboPaint.",
              "Visual gap bridging — DexUMI and RoboPaint."),
    (10, 4): ("fig_10_4_tactile_gap",
              "촉각 격차 해소의 두 접근.",
              "Two tactile gap bridging approaches."),
    (10, 5): ("fig_10_5_dexop_linkage",
              "DEXOP의 4절 링크 방식. Source: DEXOP (2025).",
              "DEXOP four-bar linkage mechanism. Source: DEXOP (2025)."),
    (10, 6): ("fig_10_6_future_challenges",
              "촉각 교차 체현 전이의 미해결 과제.",
              "Unsolved challenges in tactile cross-embodiment transfer."),
    # Ch11
    (11, 1): ("fig_11_1_fusion_architectures",
              "다중 모달 융합 아키텍처 비교.",
              "Multimodal fusion architecture comparison."),
    (11, 2): ("fig_11_2_e2e_systems",
              "네 가지 End-to-End 시스템.",
              "Four end-to-end integrated systems."),
    (11, 3): ("fig_11_3_opensource_ecosystem",
              "오픈소스 생태계 — 하드웨어, 소프트웨어, 데이터의 삼각 관계.",
              "Open-source ecosystem — hardware, software, data triangle."),
    (11, 4): ("fig_11_4_benchmarks",
              "벤치마크와 표준화 현황.",
              "Benchmark and standardization status."),
    # Ch12
    (12, 1): ("fig_12_1_physical_ai_ecosystem",
              "Physical AI 생태계.",
              "Physical AI ecosystem convergence."),
    (12, 2): ("fig_12_2_company_landscape",
              "글로벌 로봇 핸드 기업 지형도.",
              "Global robot hand company landscape."),
    (12, 3): ("fig_12_3_deployment_gap",
              "제조업 배치 사례 — 물류 수준 vs 정밀 조작 수준의 갭.",
              "Manufacturing deployment gap — logistics vs. precision manipulation."),
    (12, 4): ("fig_12_4_market_projection",
              "시장 전망과 가격 압축 추세.",
              "Market outlook and price compression trends."),
    (12, 5): ("fig_12_5_eight_trends",
              "8가지 산업 트렌드.",
              "Eight industry trends — convergence and synergy."),
    # Ch13
    (13, 1): ("fig_13_1_limitations_matrix",
              "공통 한계점 TOP 10 — 빈도와 심각도 매트릭스.",
              "Top 10 common limitations — frequency and severity matrix."),
    (13, 2): ("fig_13_2_research_groups",
              "5개 미래 연구 그룹의 관계도.",
              "Five future research groups relationship map."),
    (13, 3): ("fig_13_3_manufacturing_timeline",
              "제조업 특화 과제와 해결 예상 시점.",
              "Manufacturing-specific challenges and expected resolution timeline."),
    (13, 4): ("fig_13_4_triangle_integration",
              "메커니즘 + 촉각 + 학습의 삼각 통합.",
              "Mechanism + Tactile + Learning triangle integration."),
}

def get_chapter_dir(ch):
    return f"ch{ch:02d}"

def replace_images_in_file(filepath, lang):
    content = filepath.read_text(encoding='utf-8')

    for (ch, fig_num), (basename, caption_ko, caption_en) in FIGURES.items():
        ch_dir = get_chapter_dir(ch)
        caption = caption_ko if lang == 'ko' else caption_en
        img_path = f"../../assets/figures/{ch_dir}/{basename}_technical.png"
        replacement = f"![Figure {ch}.{fig_num}: {caption}]({img_path})"

        # Match the IMAGE tag for this figure
        pattern = rf'<!-- IMAGE: \[Figure {ch}\.{fig_num}:.*?\] -->'
        content = re.sub(pattern, replacement, content)

    filepath.write_text(content, encoding='utf-8')

# Process all chapter files
for ch in range(3, 14):
    for lang in ['ko', 'en']:
        filepath = BASE / 'book' / lang / f'ch{ch:02d}.md'
        if filepath.exists():
            replace_images_in_file(filepath, lang)
            print(f"Updated: {filepath}")

print("Done!")
