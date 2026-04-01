#!/bin/bash
export GEMINI_API_KEY=$(cat .env.local | grep GEMINI_API_KEY | cut -d= -f2)
S=".claude/skills/gemini-imagegen/scripts/generate_image.py"

gen() {
  local prompt="$1" style="$2" output="$3" size="${4:-1536x1024}"
  python3 $S --prompt "$prompt" --style "$style" --output "$output" --size "$size"
}

echo "=== CHAPTER 8 ==="

gen "VLA model timeline showing evolution from left to right: RT-1 (Google, 2022) -> RT-2 (Google, 2023) -> Octo (2024) -> OpenVLA (2024) -> pi0 (Physical Intelligence, 2024) -> Gemini Robotics (Google, 2025). Each model as a card with name, key architecture feature, and capability. Arrows showing progression: language-conditioned -> VLM backbone -> open-source -> flow matching -> world model. 4K, timeline, technical." \
  technical "assets/figures/ch08/fig_8_1_vla_timeline_technical.png"
gen "VLA timeline on dark background. RT-1 to Gemini Robotics. Glowing model cards, neon arrows." \
  darkmode "assets/figures/ch08/fig_8_1_vla_timeline_darkmode.png"
gen "Black and white VLA model timeline. Simple boxes and arrows, academic." \
  academic "assets/figures/ch08/fig_8_1_vla_timeline_academic.png" "1024x768"

gen "pi0 architecture diagram. Two main components: (1) PaLiGemma VLM backbone - processes camera image + text instruction, outputs visual-language features. (2) Flow Matching Action Expert - takes VLM features + proprioception, generates smooth continuous action trajectories through iterative denoising. Connection: VLM features feed into action expert via cross-attention. Output: 7-DoF robot actions. Reference: pi0 2024. 4K, technical." \
  technical "assets/figures/ch08/fig_8_2_pi0_architecture_technical.png"
gen "pi0 architecture on dark background. VLM + Flow Matching blocks, glowing connections, neon." \
  darkmode "assets/figures/ch08/fig_8_2_pi0_architecture_darkmode.png"
gen "Black and white pi0 architecture. Simple block diagram, academic grayscale." \
  academic "assets/figures/ch08/fig_8_2_pi0_architecture_academic.png" "1024x768"

gen "Three approaches to integrating tactile sensing with VLA models. Panel 1: ForceVLA - Mixture of Experts (MoE) with dedicated force expert gate, force/torque as separate modality token. Panel 2: Tactile-VLA - physics knowledge distillation from tactile simulator to VLA, auxiliary tactile prediction loss. Panel 3: FARM - tactile signal as conditioning input to action generation, tactile embeddings concatenated with visual features. Each shows data flow diagram. 4K, technical." \
  technical "assets/figures/ch08/fig_8_3_tactile_vla_approaches_technical.png"
gen "Three tactile-VLA integration approaches on dark background. Glowing panels, neon data flows." \
  darkmode "assets/figures/ch08/fig_8_3_tactile_vla_approaches_darkmode.png"
gen "Black and white three tactile VLA approaches. Simple block diagrams, academic." \
  academic "assets/figures/ch08/fig_8_3_tactile_vla_approaches_academic.png" "1024x768"

gen "Open X-Embodiment dataset infographic. Central logo, radiating connections to: 34 research labs (institutions shown as icons), 22 robot embodiments (different robot types illustrated), 1M+ trajectories total. Pie chart showing data distribution by task type. Bar chart of contributions by institution. Scale comparison with other robotics datasets. 4K, infographic style." \
  technical "assets/figures/ch08/fig_8_4_open_x_embodiment_technical.png"
gen "Open X-Embodiment infographic on dark background. Glowing connection network, neon statistics." \
  darkmode "assets/figures/ch08/fig_8_4_open_x_embodiment_darkmode.png"
gen "Black and white Open X-Embodiment overview. Simple diagram with statistics, academic." \
  academic "assets/figures/ch08/fig_8_4_open_x_embodiment_academic.png" "1024x768"

gen "Architecture comparison grid of four VLA models side by side. Columns: RT-2, pi0, OpenVLA, Gemini Robotics. Rows: Visual encoder (ViT variants), Language model (PaLM, Gemma, LLaMA), Action head (tokenized, flow matching, diffusion), Training data scale, Key innovation. Highlighted differences in each cell. 4K, technical comparison." \
  technical "assets/figures/ch08/fig_8_5_vla_comparison_technical.png"
gen "Four VLA architecture comparison on dark background. Glowing grid, neon color-coded components." \
  darkmode "assets/figures/ch08/fig_8_5_vla_comparison_darkmode.png"
gen "Black and white VLA architecture comparison grid. Simple table format, academic." \
  academic "assets/figures/ch08/fig_8_5_vla_comparison_academic.png" "1024x768"

gen "VLA ecosystem map showing four interconnected layers. Layer 1 Models: RT-2, pi0, OpenVLA, Gemini Robotics with connections. Layer 2 Data: Open X-Embodiment, DROID, Bridge V2 datasets. Layer 3 Hardware: robot embodiments (arms, hands, humanoids). Layer 4 Applications: manipulation, navigation, instruction following. Cross-layer connections showing which models use which data and deploy on which hardware. Network diagram, 4K." \
  technical "assets/figures/ch08/fig_8_6_vla_ecosystem_technical.png"
gen "VLA ecosystem map on dark background. Four layered network, glowing connections, neon nodes." \
  darkmode "assets/figures/ch08/fig_8_6_vla_ecosystem_darkmode.png"
gen "Black and white VLA ecosystem four-layer diagram. Simple network, academic." \
  academic "assets/figures/ch08/fig_8_6_vla_ecosystem_academic.png" "1024x768"

echo "=== CHAPTER 9 ==="

gen "Comparison grid of four tactile simulation engines. Columns: Isaac Gym (NVIDIA), MuJoCo (DeepMind), TACTO (Meta), DiffTactile. Rows: physics backend, tactile model type, parallelism (GPU envs), sensor fidelity, differentiability, key paper. Visual: each column has engine logo/icon and screenshot of tactile simulation. 4K, technical comparison." \
  technical "assets/figures/ch09/fig_9_1_sim_engines_technical.png"
gen "Four simulation engines on dark background. Glowing grid with screenshots, neon labels." \
  darkmode "assets/figures/ch09/fig_9_1_sim_engines_darkmode.png"
gen "Black and white simulation engine comparison. Simple grid table, academic." \
  academic "assets/figures/ch09/fig_9_1_sim_engines_academic.png" "1024x768"

gen "DeXtreme Automatic Domain Randomization pipeline. Left: base simulation environment. Center: ADR module that simultaneously randomizes: physics parameters (mass, friction, restitution), visual parameters (lighting, texture, camera), tactile noise parameters, control delay. Right: policy trained across diverse randomized conditions. Feedback loop: if performance > threshold, increase randomization range. Reference: DeXtreme ICRA 2023. 4K, technical." \
  technical "assets/figures/ch09/fig_9_2_dextreme_adr_technical.png"
gen "DeXtreme ADR pipeline on dark background. Glowing randomization parameters, neon feedback loop." \
  darkmode "assets/figures/ch09/fig_9_2_dextreme_adr_darkmode.png"
gen "Black and white DeXtreme ADR pipeline. Simple flow diagram, academic." \
  academic "assets/figures/ch09/fig_9_2_dextreme_adr_academic.png" "1024x768"

gen "Three challenges of tactile sim-to-real transfer. Panel 1 Gel Deformation: simulated vs real elastomer behavior, FEM approximation vs real nonlinear deformation, side-by-side comparison. Panel 2 Multi-physics Coupling: light transport + mechanics + friction all interacting, simplified models miss cross-coupling effects. Panel 3 Noise Profile: simulated noise (Gaussian) vs real sensor noise (structured, spatially correlated), distribution comparison. Each panel: problem illustration, sim vs real comparison, gap magnitude. 4K." \
  technical "assets/figures/ch09/fig_9_3_tactile_sim2real_challenges_technical.png"
gen "Three tactile sim2real challenges on dark background. Sim vs real comparisons, neon style." \
  darkmode "assets/figures/ch09/fig_9_3_tactile_sim2real_challenges_darkmode.png"
gen "Black and white three sim2real challenges. Simple comparison panels, academic." \
  academic "assets/figures/ch09/fig_9_3_tactile_sim2real_challenges_academic.png" "1024x768"

gen "ExoStart Real-Sim-Real loop pipeline. Step 1 Real: human provides 10 demonstrations with exoskeleton. Step 2 Sim: demonstrations loaded into simulation, RL training with massive parallel rollouts. Step 3 Real: trained policy transferred to real robot with zero-shot transfer. Circular arrow connecting real->sim->real. Key metrics: 10 demos sufficient, 1000x amplification in sim, zero-shot transfer success. Reference: ExoStart 2025. 4K." \
  technical "assets/figures/ch09/fig_9_4_exostart_pipeline_technical.png"
gen "ExoStart Real-Sim-Real loop on dark background. Glowing circular pipeline, neon steps." \
  darkmode "assets/figures/ch09/fig_9_4_exostart_pipeline_darkmode.png"
gen "Black and white ExoStart Real-Sim-Real loop. Simple circular flow diagram, academic." \
  academic "assets/figures/ch09/fig_9_4_exostart_pipeline_academic.png" "1024x768"

gen "Three sources of sim-to-real gap visualized as overlapping circles. Circle 1 Dynamics Gap: rigid body physics, contact models, joint friction approximation. Circle 2 Perception Gap: visual rendering fidelity, sensor noise models, lighting differences. Circle 3 Contact Model Gap: tactile-specific issues - gel deformation, slip physics, multi-point contact. Overlap region: combined effects that compound the gap. Mitigation strategies listed for each. 4K." \
  technical "assets/figures/ch09/fig_9_5_gap_sources_technical.png"
gen "Three sim2real gap sources on dark background. Overlapping glowing circles, neon labels." \
  darkmode "assets/figures/ch09/fig_9_5_gap_sources_darkmode.png"
gen "Black and white three overlapping circles for sim2real gap sources. Simple Venn diagram, academic." \
  academic "assets/figures/ch09/fig_9_5_gap_sources_academic.png" "1024x768"

gen "NVIDIA synthetic data pipeline diagram. Left: MegaHand system generating 780K trajectory pairs in IsaacGym. Center: data augmentation and domain randomization applied. Right: policy training on massive synthetic dataset. Bottom: remaining gaps identified - deformable objects, tool use, long-horizon tasks. Comparison bar: synthetic data quantity vs real data quality. 4K, technical." \
  technical "assets/figures/ch09/fig_9_6_synthetic_data_technical.png"
gen "NVIDIA synthetic data pipeline on dark background. 780K trajectories, glowing pipeline, neon stats." \
  darkmode "assets/figures/ch09/fig_9_6_synthetic_data_darkmode.png"
gen "Black and white synthetic data pipeline. Simple flow with statistics, academic." \
  academic "assets/figures/ch09/fig_9_6_synthetic_data_academic.png" "1024x768"

echo "=== CHAPTER 10 ==="

gen "Three dimensions of cross-embodiment gap. Three parallel columns: (1) Kinematic Gap - human hand has 27 DoF, robot hand has 16 DoF, different joint ranges and finger proportions, skeleton overlay comparison. (2) Visual Gap - human hand appearance in demonstrations vs robot hand needed for policy, appearance mismatch. (3) Tactile Gap - human skin 17000 receptors vs robot sparse sensors, different sensing modalities. Each column: illustration, gap magnitude, consequences. 4K." \
  technical "assets/figures/ch10/fig_10_1_three_gaps_technical.png"
gen "Three cross-embodiment gaps on dark background. Human vs robot comparison, neon style." \
  darkmode "assets/figures/ch10/fig_10_1_three_gaps_darkmode.png"
gen "Black and white three embodiment gaps. Simple side-by-side comparisons, academic." \
  academic "assets/figures/ch10/fig_10_1_three_gaps_academic.png" "1024x768"

gen "Three kinematic retargeting approaches. (1) AnyTeleop: joint angle mapping with optimization, maps human joints to nearest robot joints, handles different DoF counts. (2) ImMimic: interpolation-based, creates smooth motion from sparse keypoints, data-driven approach. (3) DexH2R: intent transfer, maps human manipulation intent rather than exact motion, semantic-level retargeting. Each: input (human motion), processing, output (robot motion). 4K." \
  technical "assets/figures/ch10/fig_10_2_kinematic_retargeting_technical.png"
gen "Three kinematic retargeting methods on dark background. Glowing motion paths, neon arrows." \
  darkmode "assets/figures/ch10/fig_10_2_kinematic_retargeting_darkmode.png"
gen "Black and white three retargeting approaches. Simple flow diagrams, academic." \
  academic "assets/figures/ch10/fig_10_2_kinematic_retargeting_academic.png" "1024x768"

gen "Visual gap bridging: two methods. Left: DexUMI with SAM2 Inpainting - original image with human hand, segmentation mask applied, robot hand inpainted to replace human, resulting in visually consistent training data. Right: RoboPaint with 3D Gaussian Splatting - captures scene with 3DGS, replaces hand model in 3D space, renders photorealistic robot hand views. Before/after pairs for each. 4K." \
  technical "assets/figures/ch10/fig_10_3_visual_gap_technical.png"
gen "DexUMI and RoboPaint visual gap bridging on dark background. Before/after, neon highlights." \
  darkmode "assets/figures/ch10/fig_10_3_visual_gap_darkmode.png"
gen "Black and white visual gap bridging methods. Simple before/after panels, academic." \
  academic "assets/figures/ch10/fig_10_3_visual_gap_academic.png" "1024x768"

gen "Two tactile gap bridging approaches. Left: UniTacHand - MANO UV map alignment, maps human skin touch locations to robot sensor positions using shared UV coordinate space, enables tactile data transfer. Right: OSMO physical sharing - same physical glove worn by human and robot, identical sensor hardware eliminates the sensing gap entirely. Comparison: digital transfer vs physical sharing. 4K." \
  technical "assets/figures/ch10/fig_10_4_tactile_gap_technical.png"
gen "UniTacHand vs OSMO tactile gap bridging on dark background. UV maps and glove diagram, neon." \
  darkmode "assets/figures/ch10/fig_10_4_tactile_gap_darkmode.png"
gen "Black and white tactile gap approaches. Simple diagrams, academic." \
  academic "assets/figures/ch10/fig_10_4_tactile_gap_academic.png" "1024x768"

gen "DEXOP four-bar linkage mechanism diagram. Mechanical coupling between human finger and robot finger via four-bar linkage. Shows: human finger segment connected through link bars to robot finger segment, force transmission path, joint angle relationship. Advantages: direct mechanical mapping, no calibration needed, real-time force feedback. Reference: DEXOP 2025. Engineering cross-section drawing, 4K." \
  technical "assets/figures/ch10/fig_10_5_dexop_linkage_technical.png"
gen "DEXOP four-bar linkage on dark background. Glowing mechanical links, neon force arrows." \
  darkmode "assets/figures/ch10/fig_10_5_dexop_linkage_darkmode.png"
gen "Black and white DEXOP four-bar linkage. Simple mechanical drawing, academic." \
  academic "assets/figures/ch10/fig_10_5_dexop_linkage_academic.png" "1024x768"

gen "Research roadmap for unsolved tactile cross-embodiment challenges. Mind-map with central node 'Tactile Retargeting Challenges'. Branches: (1) Multi-finger coordination transfer. (2) Deformable object manipulation. (3) Real-time tactile feedback retargeting. (4) Standardized benchmarks needed. (5) Foundation model approach to retargeting. Each branch: current status, difficulty level, expected timeline. 4K." \
  technical "assets/figures/ch10/fig_10_6_future_challenges_technical.png"
gen "Retargeting future challenges on dark background. Glowing mind-map, neon difficulty indicators." \
  darkmode "assets/figures/ch10/fig_10_6_future_challenges_darkmode.png"
gen "Black and white retargeting future challenges mind-map. Simple nodes, academic." \
  academic "assets/figures/ch10/fig_10_6_future_challenges_academic.png" "1024x768"

echo "=== CHAPTER 11 ==="

gen "Four multimodal fusion architectures compared. (1) Early Fusion: raw sensor data concatenated before any processing, single shared encoder. (2) Late Fusion: separate encoders per modality, features merged at decision layer. (3) MoE Fusion: Mixture of Experts with modality-specific experts and gating network. (4) Attention-based Fusion: cross-attention between modality feature maps, dynamic weighting. Each: block diagram, data flow, pros/cons annotation. 4K." \
  technical "assets/figures/ch11/fig_11_1_fusion_architectures_technical.png"
gen "Four fusion architectures on dark background. Glowing block diagrams, neon data paths." \
  darkmode "assets/figures/ch11/fig_11_1_fusion_architectures_darkmode.png"
gen "Black and white four fusion architectures. Simple block diagrams, academic." \
  academic "assets/figures/ch11/fig_11_1_fusion_architectures_academic.png" "1024x768"

gen "Four end-to-end integrated systems compared. (1) Mobile ALOHA: dual-arm mobile manipulation, bimanual tasks. (2) TacEx: tactile exploration with active sensing. (3) PP-Tac: paper picking with omnidirectional tactile. (4) Seminar 3 Integrated Gripper: underactuation + VSA + active belt. Each system: photo/illustration, key components, integration approach, target task. 4K, technical." \
  technical "assets/figures/ch11/fig_11_2_e2e_systems_technical.png"
gen "Four end-to-end systems on dark background. Glowing system illustrations, neon labels." \
  darkmode "assets/figures/ch11/fig_11_2_e2e_systems_darkmode.png"
gen "Black and white four end-to-end systems. Simple block diagrams, academic." \
  academic "assets/figures/ch11/fig_11_2_e2e_systems_academic.png" "1024x768"

gen "Open-source ecosystem triangle diagram. Three vertices: Hardware (LEAP Hand, AnySkin, open-source grippers), Software (Isaac Lab, LeRobot, OpenVLA frameworks), Data (Open X-Embodiment, DROID, VTDexManip). Edges: hardware-software integration, software-data pipelines, data-hardware compatibility. Center: community/labs contributing. Key projects labeled on each edge. 4K." \
  technical "assets/figures/ch11/fig_11_3_opensource_ecosystem_technical.png"
gen "Open-source ecosystem triangle on dark background. Glowing vertices and edges, neon project names." \
  darkmode "assets/figures/ch11/fig_11_3_opensource_ecosystem_darkmode.png"
gen "Black and white open-source ecosystem triangle. Simple labeled triangle, academic." \
  academic "assets/figures/ch11/fig_11_3_opensource_ecosystem_academic.png" "1024x768"

gen "Benchmark and standardization status overview. Three columns: (1) Existing benchmarks: RGMC grasping benchmark, DexGraspNet, dexterous manipulation metrics. (2) Missing benchmarks: no unified tactile sensor benchmark, no cross-platform comparison standard. (3) Data format candidates: RLDS, LeRobot format, proposed unified tactile data schema. Status indicators: green (exists), yellow (in progress), red (missing). 4K." \
  technical "assets/figures/ch11/fig_11_4_benchmarks_technical.png"
gen "Benchmark status overview on dark background. Three columns with status indicators, neon colors." \
  darkmode "assets/figures/ch11/fig_11_4_benchmarks_darkmode.png"
gen "Black and white benchmark status three-column overview. Simple table with indicators, academic." \
  academic "assets/figures/ch11/fig_11_4_benchmarks_academic.png" "1024x768"

echo "=== CHAPTER 12 ==="

gen "Physical AI ecosystem convergence diagram. Three converging streams: (1) NVIDIA Isaac: simulation platform, Isaac Gym/Lab, digital twins. (2) Foundation Models: VLAs, tactile foundation models, world models. (3) Hardware: dexterous hands, tactile sensors, humanoids. Convergence point: Physical AI for manipulation. Key companies at each stream. Synergy arrows between streams. 4K." \
  technical "assets/figures/ch12/fig_12_1_physical_ai_ecosystem_technical.png"
gen "Physical AI convergence on dark background. Three glowing streams merging, neon labels." \
  darkmode "assets/figures/ch12/fig_12_1_physical_ai_ecosystem_darkmode.png"
gen "Black and white Physical AI ecosystem convergence. Simple three-stream diagram, academic." \
  academic "assets/figures/ch12/fig_12_1_physical_ai_ecosystem_academic.png" "1024x768"

gen "Global robot hand company landscape map. 11 companies positioned on 2D grid: X-axis cost (low to high), Y-axis dexterity/DoF (low to high). Companies: Shadow Robot (UK), Wonik Robotics/Allegro (Korea), GelSight (US), SynTouch (US), Physical Intelligence (US), Figure (US), Agility Robotics (US), Sanctuary AI (Canada), Tesla Optimus (US), 1X Technologies (Norway), Apptronik (US). Color by category: hand makers, sensor makers, humanoid integrators. 4K." \
  technical "assets/figures/ch12/fig_12_2_company_landscape_technical.png"
gen "Robot hand company landscape on dark background. Scatter grid with company logos, neon positioning." \
  darkmode "assets/figures/ch12/fig_12_2_company_landscape_darkmode.png"
gen "Black and white company landscape positioning map. Simple scatter grid, academic." \
  academic "assets/figures/ch12/fig_12_2_company_landscape_academic.png" "1024x768"

gen "Manufacturing deployment gap visualization. Left side 'Logistics Level': warehouse pick-and-place, achieved reliability >99%, simple grippers, deployed at scale by Amazon/Berkshire Grey. Right side 'Precision Manipulation Level': assembly, insertion, cable routing, research-level reliability ~80%, needs dexterous hands and tactile sensing. Center gap: reliability, sensor integration, cost barriers. Arrow showing path to bridge the gap. 4K." \
  technical "assets/figures/ch12/fig_12_3_deployment_gap_technical.png"
gen "Manufacturing deployment gap on dark background. Logistics vs precision, glowing gap indicator." \
  darkmode "assets/figures/ch12/fig_12_3_deployment_gap_darkmode.png"
gen "Black and white deployment gap diagram. Simple two-level comparison, academic." \
  academic "assets/figures/ch12/fig_12_3_deployment_gap_academic.png" "1024x768"

gen "Market outlook and price compression chart. Dual-axis chart: Left Y-axis: market size (billions USD) growing from 2020 to 2030. Right Y-axis: robot hand cost (USD) decreasing. Line 1: dexterous manipulation market growth (exponential). Line 2: robot hand cost reduction from $100K (Shadow Hand 2015) through $15K (Allegro 2020) to $2K (LEAP 2023) to projected $500 (2026). 50x reduction in 5 years highlighted. Key inflection points annotated. 4K." \
  technical "assets/figures/ch12/fig_12_4_market_projection_technical.png"
gen "Market growth and price compression on dark background. Dual chart with glowing lines, neon annotations." \
  darkmode "assets/figures/ch12/fig_12_4_market_projection_darkmode.png"
gen "Black and white market and price chart. Simple dual-axis line chart, academic." \
  academic "assets/figures/ch12/fig_12_4_market_projection_academic.png" "1024x768"

gen "Eight industry trends convergence diagram. Circular arrangement of 8 trends: (1) Cost reduction, (2) Foundation models, (3) Sim-to-real maturation, (4) Humanoid integration, (5) Tactile standardization, (6) Open-source hardware, (7) Physical AI platforms, (8) Manufacturing demand. Synergy connections between related trends (lines). Central theme: convergence toward accessible dexterous manipulation. 4K." \
  technical "assets/figures/ch12/fig_12_5_eight_trends_technical.png"
gen "Eight industry trends circle on dark background. Glowing nodes and synergy connections, neon." \
  darkmode "assets/figures/ch12/fig_12_5_eight_trends_darkmode.png"
gen "Black and white eight industry trends. Simple circular arrangement, academic." \
  academic "assets/figures/ch12/fig_12_5_eight_trends_academic.png" "1024x768"

echo "=== CHAPTER 13 ==="

gen "Top 10 common limitations matrix. X-axis: frequency of mention in literature. Y-axis: severity/impact on deployment. 10 labeled points: (1) tactile sim-to-real gap, (2) sensor durability, (3) data scarcity, (4) cross-embodiment transfer, (5) real-time processing, (6) standardization, (7) cost, (8) multi-finger coordination, (9) deformable objects, (10) long-horizon planning. Quadrant labels: high-freq/high-severity = critical, etc. Color-coded urgency. 4K." \
  technical "assets/figures/ch13/fig_13_1_limitations_matrix_technical.png"
gen "Top 10 limitations matrix on dark background. Glowing scatter points, neon urgency colors." \
  darkmode "assets/figures/ch13/fig_13_1_limitations_matrix_darkmode.png"
gen "Black and white limitations frequency-severity matrix. Simple labeled scatter, academic." \
  academic "assets/figures/ch13/fig_13_1_limitations_matrix_academic.png" "1024x768"

gen "Five future research groups relationship map. Central hub with five clusters radiating: (1) Sensing: next-gen sensors, foundation models for touch, multimodal. (2) Learning: VLA + tactile, sim-to-real, few-shot. (3) Hardware: affordable hands, modular design, humanoid integration. (4) Data: large-scale collection, synthetic augmentation, cross-sensor. (5) Deployment: reliability, standardization, cost reduction. Inter-group connections showing dependencies. Concentric ring layout, 4K." \
  technical "assets/figures/ch13/fig_13_2_research_groups_technical.png"
gen "Five research groups on dark background. Glowing clusters with connections, neon nodes." \
  darkmode "assets/figures/ch13/fig_13_2_research_groups_darkmode.png"
gen "Black and white five research group relationship map. Simple cluster diagram, academic." \
  academic "assets/figures/ch13/fig_13_2_research_groups_academic.png" "1024x768"

gen "Manufacturing-specific challenges timeline. Horizontal timeline from 2025 to 2035 showing expected resolution dates. Challenges grouped by: Near-term (2025-2027): robust grasping, pick-and-place reliability. Medium-term (2027-2030): assembly tasks, deformable manipulation, multi-step processes. Long-term (2030-2035): full autonomous manufacturing, human-level dexterity. Difficulty gradient and dependency arrows. 4K." \
  technical "assets/figures/ch13/fig_13_3_manufacturing_timeline_technical.png"
gen "Manufacturing challenge timeline on dark background. Glowing timeline with milestones, neon bars." \
  darkmode "assets/figures/ch13/fig_13_3_manufacturing_timeline_darkmode.png"
gen "Black and white manufacturing challenge timeline 2025-2035. Simple horizontal bars, academic." \
  academic "assets/figures/ch13/fig_13_3_manufacturing_timeline_academic.png" "1024x768"

gen "Triangle integration diagram: Mechanism + Tactile + Learning. Three vertices of equilateral triangle: Vertex 1 'Intelligent Mechanisms' (underactuation, VSA, active surfaces), Vertex 2 'Tactile Sensing' (VBTS, foundation models, multimodal), Vertex 3 'Learning' (IL, RL, VLA). Each edge: synergy description. Edge 1-2: hardware-informed sensing. Edge 2-3: touch-guided learning. Edge 1-3: physics-informed policy. Center: unified dexterous manipulation. 4K." \
  technical "assets/figures/ch13/fig_13_4_triangle_integration_technical.png"
gen "Mechanism-Tactile-Learning triangle on dark background. Glowing vertices and edges, neon synergies." \
  darkmode "assets/figures/ch13/fig_13_4_triangle_integration_darkmode.png"
gen "Black and white triangle integration diagram. Simple labeled triangle, academic." \
  academic "assets/figures/ch13/fig_13_4_triangle_integration_academic.png" "1024x768"

echo "All Ch08-Ch13 figures complete!"
