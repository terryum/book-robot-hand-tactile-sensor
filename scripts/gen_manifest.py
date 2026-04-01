#!/usr/bin/env python3
"""Generate the complete figure manifest from existing figure files."""
import json
from pathlib import Path

BASE = Path("/Users/terrytaewoongum/Codes/personal/book-tactile-hand-harness-auto")
FIGURES_DIR = BASE / "assets" / "figures"

# All figures metadata
FIGURES_META = {
    # Ch01
    "fig_1_1": {"ch": 1, "type": "original", "basename": "fig_1_1_mechanoreceptors",
                "ko": "인간 손의 기계적 수용기 분포. Adapted from Johansson & Flanagan (2009).",
                "en": "Distribution of mechanoreceptors in the human hand. Adapted from Johansson & Flanagan (2009).",
                "source": "Johansson & Flanagan, 2009"},
    "fig_1_2": {"ch": 1, "type": "original", "basename": "fig_1_2_timeline",
                "ko": "촉각 로봇 공학의 4세대 타임라인 (1965-2026).",
                "en": "Four generations of tactile robotics (1965-2026).",
                "source": "Adapted from Tactile Robotics: Past and Future (2025)", "mermaid": True},
    "fig_1_3": {"ch": 1, "type": "citation", "basename": "fig_1_3_sensor_evolution",
                "ko": "촉각 센서 기술의 진화. Source: Yuan et al. (2017), Lambeta et al. (2020, 2024).",
                "en": "Evolution of tactile sensor technology. Source: Yuan et al. (2017), Lambeta et al. (2020, 2024).",
                "source": "Yuan et al. (2017), Lambeta et al. (2020, 2024)"},
    "fig_1_4": {"ch": 1, "type": "original", "basename": "fig_1_4_vision_vs_tactile",
                "ko": "시각 vs 촉각의 시간 응답 비교.",
                "en": "Temporal response comparison — vision vs. tactile for slip detection."},
    "fig_1_5": {"ch": 1, "type": "original", "basename": "fig_1_5_four_capabilities",
                "ko": "촉각이 가능하게 하는 4가지 핵심 능력.",
                "en": "Four core capabilities enabled by tactile sensing.", "mermaid": True},
    "fig_1_6": {"ch": 1, "type": "original", "basename": "fig_1_6_manipulation_spectrum",
                "ko": "로봇 조작 능력의 스펙트럼.",
                "en": "The manipulation capability spectrum."},
    "fig_1_7": {"ch": 1, "type": "original", "basename": "fig_1_7_book_roadmap",
                "ko": "책 구성 로드맵.", "en": "Book roadmap.", "mermaid": True},
    # Ch02
    "fig_2_1": {"ch": 2, "type": "original", "basename": "fig_2_1_transduction_principles",
                "ko": "5가지 촉각 센서 변환 원리의 비교.", "en": "Comparison of five tactile sensor transduction principles."},
    "fig_2_2": {"ch": 2, "type": "citation", "basename": "fig_2_2_vbts_evolution",
                "ko": "비전 기반 촉각 센서의 진화.", "en": "Evolution of vision-based tactile sensors.",
                "source": "Yuan et al. (2017), Wang et al. (2021), Lambeta et al. (2020, 2024)"},
    "fig_2_3": {"ch": 2, "type": "original", "basename": "fig_2_3_photometric_stereo",
                "ko": "비전 기반 촉각 센서의 작동 원리.", "en": "Operating principle of vision-based tactile sensors."},
    "fig_2_4": {"ch": 2, "type": "original", "basename": "fig_2_4_multiaxis_force",
                "ko": "다축 촉각 센싱.", "en": "Multi-axis tactile sensing."},
    "fig_2_5": {"ch": 2, "type": "citation", "basename": "fig_2_5_ftac_hand",
                "ko": "F-TAC Hand의 센서 배치.", "en": "F-TAC Hand sensor layout.",
                "source": "F-TAC Hand (Nature Machine Intelligence, 2025)"},
    "fig_2_6": {"ch": 2, "type": "original", "basename": "fig_2_6_nextgen_sensors",
                "ko": "차세대 촉각 센서 기술.", "en": "Next-generation tactile sensor technologies."},
    # Ch03
    "fig_3_1": {"ch": 3, "type": "citation", "basename": "fig_3_1_albini_taxonomy",
                "ko": "Albini 촉각 데이터 분류 체계.", "en": "Albini tactile data taxonomy.",
                "source": "Albini et al. (2025)", "mermaid": True},
    "fig_3_2": {"ch": 3, "type": "original", "basename": "fig_3_2_representation_comparison",
                "ko": "6가지 촉각 데이터 표현 비교.", "en": "Six tactile data representations comparison."},
    "fig_3_3": {"ch": 3, "type": "original", "basename": "fig_3_3_sensor_agnostic",
                "ko": "센서 무관 촉각 표현.", "en": "Sensor-agnostic tactile representations."},
    "fig_3_4": {"ch": 3, "type": "original", "basename": "fig_3_4_collection_pipelines",
                "ko": "데이터 수집 파이프라인 비교.", "en": "Data collection pipeline comparison."},
    "fig_3_5": {"ch": 3, "type": "original", "basename": "fig_3_5_dataset_comparison",
                "ko": "촉각 데이터셋 비교.", "en": "Tactile dataset comparison."},
    "fig_3_6": {"ch": 3, "type": "original", "basename": "fig_3_6_foundation_models",
                "ko": "촉각 Foundation Model 비교.", "en": "Tactile foundation model comparison."},
    # Ch04-Ch13 (abbreviated for brevity - using basename as key)
    "fig_4_1": {"ch": 4, "type": "original", "basename": "fig_4_1_gripper_spectrum", "ko": "그리퍼-핸드 스펙트럼.", "en": "Gripper-hand spectrum."},
    "fig_4_2": {"ch": 4, "type": "original", "basename": "fig_4_2_hand_cost_performance", "ko": "비용-성능 비교.", "en": "Cost-performance comparison."},
    "fig_4_3": {"ch": 4, "type": "original", "basename": "fig_4_3_tendon_hands", "ko": "건 구동 핸드 비교.", "en": "Tendon-driven hand comparison."},
    "fig_4_4": {"ch": 4, "type": "original", "basename": "fig_4_4_design_axes", "ko": "설계 4축 레이더 차트.", "en": "Four design axes radar chart."},
    "fig_4_5": {"ch": 4, "type": "citation", "basename": "fig_4_5_sensor_integration", "ko": "센서 통합 전략.", "en": "Sensor integration strategies.", "source": "F-TAC Hand (2025), ORCA (2025)"},
    "fig_4_6": {"ch": 4, "type": "original", "basename": "fig_4_6_allegro_ecosystem", "ko": "Allegro 연구 생태계.", "en": "Allegro research ecosystem."},
    "fig_5_1": {"ch": 5, "type": "original", "basename": "fig_5_1_underactuation", "ko": "부족 구동 적응.", "en": "Underactuation adaptation."},
    "fig_5_2": {"ch": 5, "type": "original", "basename": "fig_5_2_variable_stiffness", "ko": "가변 강성 메커니즘.", "en": "Variable stiffness mechanisms."},
    "fig_5_3": {"ch": 5, "type": "original", "basename": "fig_5_3_active_belt", "ko": "능동 벨트.", "en": "Active belt."},
    "fig_5_4": {"ch": 5, "type": "original", "basename": "fig_5_4_integrated_architecture", "ko": "통합 아키텍처.", "en": "Integrated architecture."},
    "fig_5_5": {"ch": 5, "type": "original", "basename": "fig_5_5_factory_tasks", "ko": "공장 자동화 과제.", "en": "Factory automation tasks."},
    "fig_5_6": {"ch": 5, "type": "original", "basename": "fig_5_6_contact_continuity", "ko": "연속 접촉 상태.", "en": "Contact continuity states."},
    "fig_6_1": {"ch": 6, "type": "citation", "basename": "fig_6_1_mano_model", "ko": "MANO 모델.", "en": "MANO model.", "source": "Romero et al. (2017)"},
    "fig_6_2": {"ch": 6, "type": "original", "basename": "fig_6_2_tracking_gloves", "ko": "트래킹 글로브 비교.", "en": "Tracking glove comparison."},
    "fig_6_3": {"ch": 6, "type": "citation", "basename": "fig_6_3_osmo_bridge", "ko": "OSMO 브리지.", "en": "OSMO bridge.", "source": "OSMO (2025)"},
    "fig_6_4": {"ch": 6, "type": "citation", "basename": "fig_6_4_dexumi", "ko": "DexUMI 이중 격차.", "en": "DexUMI dual gap.", "source": "DexUMI (2025)"},
    "fig_6_5": {"ch": 6, "type": "original", "basename": "fig_6_5_collection_spectrum", "ko": "수집 방법 스펙트럼.", "en": "Collection method spectrum."},
    "fig_6_6": {"ch": 6, "type": "original", "basename": "fig_6_6_teleop_comparison", "ko": "원격 조작 비교.", "en": "Teleoperation comparison."},
    "fig_7_1": {"ch": 7, "type": "original", "basename": "fig_7_1_diffusion_vs_act", "ko": "Diffusion vs ACT.", "en": "Diffusion vs ACT."},
    "fig_7_2": {"ch": 7, "type": "original", "basename": "fig_7_2_tactile_rl_pipeline", "ko": "촉각 RL 파이프라인.", "en": "Tactile RL pipeline."},
    "fig_7_3": {"ch": 7, "type": "citation", "basename": "fig_7_3_pptac", "ko": "PP-Tac 시스템.", "en": "PP-Tac system.", "source": "PP-Tac (RSS 2025)"},
    "fig_7_4": {"ch": 7, "type": "original", "basename": "fig_7_4_force_learning", "ko": "힘 기반 학습.", "en": "Force-informed learning."},
    "fig_7_5": {"ch": 7, "type": "original", "basename": "fig_7_5_il_rl_optimization", "ko": "IL vs RL vs 최적화.", "en": "IL vs RL vs Optimization."},
    "fig_7_6": {"ch": 7, "type": "original", "basename": "fig_7_6_tactile_landscape", "ko": "촉각 조작 학습 지형도.", "en": "Tactile manipulation landscape."},
    "fig_8_1": {"ch": 8, "type": "original", "basename": "fig_8_1_vla_timeline", "ko": "VLA 타임라인.", "en": "VLA timeline.", "mermaid": True},
    "fig_8_2": {"ch": 8, "type": "citation", "basename": "fig_8_2_pi0_architecture", "ko": "pi0 아키텍처.", "en": "pi0 architecture.", "source": "pi0 (2024)"},
    "fig_8_3": {"ch": 8, "type": "original", "basename": "fig_8_3_tactile_vla_approaches", "ko": "촉각-VLA 통합.", "en": "Tactile-VLA integration."},
    "fig_8_4": {"ch": 8, "type": "original", "basename": "fig_8_4_open_x_embodiment", "ko": "Open X-Embodiment.", "en": "Open X-Embodiment."},
    "fig_8_5": {"ch": 8, "type": "original", "basename": "fig_8_5_vla_comparison", "ko": "VLA 아키텍처 비교.", "en": "VLA architecture comparison."},
    "fig_8_6": {"ch": 8, "type": "original", "basename": "fig_8_6_vla_ecosystem", "ko": "VLA 생태계.", "en": "VLA ecosystem."},
    "fig_9_1": {"ch": 9, "type": "original", "basename": "fig_9_1_sim_engines", "ko": "시뮬레이션 엔진 비교.", "en": "Simulation engine comparison."},
    "fig_9_2": {"ch": 9, "type": "citation", "basename": "fig_9_2_dextreme_adr", "ko": "DeXtreme ADR.", "en": "DeXtreme ADR.", "source": "DeXtreme (ICRA 2023)"},
    "fig_9_3": {"ch": 9, "type": "original", "basename": "fig_9_3_tactile_sim2real_challenges", "ko": "촉각 sim2real 도전.", "en": "Tactile sim2real challenges."},
    "fig_9_4": {"ch": 9, "type": "citation", "basename": "fig_9_4_exostart_pipeline", "ko": "ExoStart 파이프라인.", "en": "ExoStart pipeline.", "source": "ExoStart (2025)"},
    "fig_9_5": {"ch": 9, "type": "original", "basename": "fig_9_5_gap_sources", "ko": "격차 3대 원인.", "en": "Three gap sources."},
    "fig_9_6": {"ch": 9, "type": "original", "basename": "fig_9_6_synthetic_data", "ko": "합성 데이터.", "en": "Synthetic data."},
    "fig_10_1": {"ch": 10, "type": "original", "basename": "fig_10_1_three_gaps", "ko": "교차체현 3차원 격차.", "en": "Three embodiment gaps."},
    "fig_10_2": {"ch": 10, "type": "original", "basename": "fig_10_2_kinematic_retargeting", "ko": "운동학적 리타게팅.", "en": "Kinematic retargeting."},
    "fig_10_3": {"ch": 10, "type": "original", "basename": "fig_10_3_visual_gap", "ko": "시각적 격차 해소.", "en": "Visual gap bridging."},
    "fig_10_4": {"ch": 10, "type": "original", "basename": "fig_10_4_tactile_gap", "ko": "촉각 격차 해소.", "en": "Tactile gap bridging."},
    "fig_10_5": {"ch": 10, "type": "citation", "basename": "fig_10_5_dexop_linkage", "ko": "DEXOP 4절 링크.", "en": "DEXOP four-bar linkage.", "source": "DEXOP (2025)"},
    "fig_10_6": {"ch": 10, "type": "original", "basename": "fig_10_6_future_challenges", "ko": "미해결 과제.", "en": "Unsolved challenges."},
    "fig_11_1": {"ch": 11, "type": "original", "basename": "fig_11_1_fusion_architectures", "ko": "융합 아키텍처.", "en": "Fusion architectures."},
    "fig_11_2": {"ch": 11, "type": "original", "basename": "fig_11_2_e2e_systems", "ko": "E2E 시스템.", "en": "E2E systems."},
    "fig_11_3": {"ch": 11, "type": "original", "basename": "fig_11_3_opensource_ecosystem", "ko": "오픈소스 생태계.", "en": "Open-source ecosystem.", "mermaid": True},
    "fig_11_4": {"ch": 11, "type": "original", "basename": "fig_11_4_benchmarks", "ko": "벤치마크 현황.", "en": "Benchmark status."},
    "fig_12_1": {"ch": 12, "type": "original", "basename": "fig_12_1_physical_ai_ecosystem", "ko": "Physical AI 생태계.", "en": "Physical AI ecosystem."},
    "fig_12_2": {"ch": 12, "type": "original", "basename": "fig_12_2_company_landscape", "ko": "기업 지형도.", "en": "Company landscape."},
    "fig_12_3": {"ch": 12, "type": "original", "basename": "fig_12_3_deployment_gap", "ko": "배치 갭.", "en": "Deployment gap."},
    "fig_12_4": {"ch": 12, "type": "original", "basename": "fig_12_4_market_projection", "ko": "시장 전망.", "en": "Market projection."},
    "fig_12_5": {"ch": 12, "type": "original", "basename": "fig_12_5_eight_trends", "ko": "8대 트렌드.", "en": "Eight trends."},
    "fig_13_1": {"ch": 13, "type": "original", "basename": "fig_13_1_limitations_matrix", "ko": "한계점 매트릭스.", "en": "Limitations matrix."},
    "fig_13_2": {"ch": 13, "type": "original", "basename": "fig_13_2_research_groups", "ko": "연구 그룹.", "en": "Research groups."},
    "fig_13_3": {"ch": 13, "type": "original", "basename": "fig_13_3_manufacturing_timeline", "ko": "제조업 과제 타임라인.", "en": "Manufacturing timeline."},
    "fig_13_4": {"ch": 13, "type": "original", "basename": "fig_13_4_triangle_integration", "ko": "삼각 통합.", "en": "Triangle integration.", "mermaid": True},
}

figures_list = []
for fig_id, meta in sorted(FIGURES_META.items()):
    ch = meta["ch"]
    ch_dir = f"ch{ch:02d}"
    basename = meta["basename"]

    entry = {
        "id": fig_id,
        "chapter": ch,
        "type": meta["type"],
        "caption_ko": meta["ko"],
        "caption_en": meta["en"],
        "files": {
            "technical": f"assets/figures/{ch_dir}/{basename}_technical.png",
            "darkmode": f"assets/figures/{ch_dir}/{basename}_darkmode.png",
            "academic": f"assets/figures/{ch_dir}/{basename}_academic.png"
        },
        "format": "png"
    }
    if meta.get("source"):
        entry["source_paper"] = meta["source"]
    if meta.get("mermaid"):
        entry["mermaid"] = f"assets/figures/mermaid/{fig_id.replace('fig_', 'fig_')}.mmd"
        entry["format"] = "png + mermaid"

    figures_list.append(entry)

manifest = {
    "metadata": {
        "created": "2026-04-01",
        "agent": "illustrator",
        "last_updated": "2026-04-01T16:30:00Z",
        "total_figures": len(figures_list),
        "total_files": len(figures_list) * 3,
        "chapters_completed": list(range(1, 14))
    },
    "figures": figures_list
}

output_path = BASE / "_workspace" / "02_illustrator_figure_manifest.json"
with open(output_path, 'w', encoding='utf-8') as f:
    json.dump(manifest, f, ensure_ascii=False, indent=2)

print(f"Manifest written: {output_path}")
print(f"Total figures: {len(figures_list)}")
print(f"Total PNG files: {len(figures_list) * 3}")
