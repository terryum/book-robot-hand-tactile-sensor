#!/bin/bash
export GEMINI_API_KEY=$(cat .env.local | grep GEMINI_API_KEY | cut -d= -f2)
S=".claude/skills/gemini-imagegen/scripts/generate_image.py"

gen() {
  local prompt="$1" style="$2" output="$3" size="${4:-1536x1024}"
  python3 $S --prompt "$prompt" --style "$style" --output "$output" --size "$size"
}

echo "=== CHAPTER 3 ==="

# Fig 3.1: Albini taxonomy
gen "Hierarchical taxonomy diagram of tactile data representations from Albini et al. 2025. Six categories in tree structure: (1) Vector - 1D array of sensor readings, (2) Matrix - 2D grid of taxel values, (3) Map - spatial contact distribution, (4) Point Cloud - 3D scattered contact points, (5) Mesh - triangulated surface, (6) Image - camera-based visual tactile output. Root node 'Tactile Data Representation' branches into 'From Raw Measurements' (Vector, Matrix, Map) and 'From Taxel Distribution' (Point Cloud, Mesh, Image). Each leaf shows small icon example. Clean tree layout, 4K." \
  technical "assets/figures/ch03/fig_3_1_albini_taxonomy_technical.png"
gen "Albini taxonomy of tactile data on dark background. Six categories in glowing tree. Neon style." \
  darkmode "assets/figures/ch03/fig_3_1_albini_taxonomy_darkmode.png"
gen "Black and white tree diagram of six tactile data representations. Simple academic figure." \
  academic "assets/figures/ch03/fig_3_1_albini_taxonomy_academic.png" "1024x768"

# Fig 3.2: Data representation comparison
gen "Comparison table visualization of six tactile data structures. Six columns: Vector, Matrix, Map, Point Cloud, Mesh, Image. Rows: example visualization (small icon), dimensionality, suitable tasks (grasp detection, slip, texture), sensor compatibility, storage size. Color-coded suitability indicators (green=good, yellow=moderate, red=poor). Clean comparison grid, 4K, technical style." \
  technical "assets/figures/ch03/fig_3_2_representation_comparison_technical.png"
gen "Six tactile data structures comparison on dark background. Glowing grid with color indicators. Neon dark theme." \
  darkmode "assets/figures/ch03/fig_3_2_representation_comparison_darkmode.png"
gen "Black and white comparison of six tactile data representations. Simple grid table, academic grayscale." \
  academic "assets/figures/ch03/fig_3_2_representation_comparison_academic.png" "1024x768"

# Fig 3.3: Sensor-agnostic representations
gen "Three approaches to sensor-agnostic tactile representation shown as parallel pipelines. (1) AnyTouch: multiple sensor inputs -> shared encoder -> unified static+dynamic features. (2) Sensor-Invariant: domain adaptation between sensors, adversarial training. (3) Canonical 3D: raw contact -> 3D surface reconstruction -> standardized point cloud. Each pipeline shows input (different sensor types), processing, output (unified representation). Arrows and flow diagram, 4K, technical illustration." \
  technical "assets/figures/ch03/fig_3_3_sensor_agnostic_technical.png"
gen "Three sensor-agnostic representation approaches on dark background. Parallel glowing pipelines. Dark themed." \
  darkmode "assets/figures/ch03/fig_3_3_sensor_agnostic_darkmode.png"
gen "Black and white three parallel pipelines for sensor-agnostic tactile representation. Simple flow diagram, academic." \
  academic "assets/figures/ch03/fig_3_3_sensor_agnostic_academic.png" "1024x768"

# Fig 3.4: Data collection pipelines
gen "Four tactile data collection pipelines shown as parallel tracks. (1) Teleoperation: human operator with controller -> robot executes -> tactile data recorded. (2) Learning from Demonstration: human demonstrates with gloves -> motion captured -> replayed on robot. (3) Autonomous Exploration: robot self-explores with curiosity-driven policy. (4) Synthetic Data: physics simulator generates tactile readings. Each track shows throughput (samples/hour) and data quality. Bottom: comparison bar chart of scale vs fidelity. 4K, technical diagram." \
  technical "assets/figures/ch03/fig_3_4_collection_pipelines_technical.png"
gen "Four data collection pipelines on dark background: teleoperation, demonstration, autonomous, synthetic. Glowing tracks, neon style." \
  darkmode "assets/figures/ch03/fig_3_4_collection_pipelines_darkmode.png"
gen "Black and white four parallel data collection pipelines. Simple flow diagrams with labels. Academic grayscale." \
  academic "assets/figures/ch03/fig_3_4_collection_pipelines_academic.png" "1024x768"

# Fig 3.5: Dataset comparison
gen "Bubble chart comparing major tactile datasets. X-axis: number of samples (log scale). Y-axis: number of modalities. Bubble size: number of tasks. Datasets: YCB-Slide (2022), Touch-and-Go (2022), ObjectFolder (2023), VTDexManip (2025, largest), Sparsh pre-training data (460K+). Color by sensor type: GelSight blue, DIGIT green, multiple purple. Clear labels on each bubble. 4K, publication quality chart." \
  technical "assets/figures/ch03/fig_3_5_dataset_comparison_technical.png"
gen "Tactile dataset bubble chart on dark background. Glowing bubbles, neon labels. Dark themed." \
  darkmode "assets/figures/ch03/fig_3_5_dataset_comparison_darkmode.png"
gen "Black and white bubble chart of tactile datasets. Size, modality, scale axes. Simple academic style." \
  academic "assets/figures/ch03/fig_3_5_dataset_comparison_academic.png" "1024x768"

# Fig 3.6: Foundation models comparison
gen "Side-by-side architecture comparison of two tactile foundation models. Left: Sparsh (Meta, 2024) - self-supervised learning, MAE/DINO/IJEPA encoders, pre-trained on 460K+ images from multiple sensors, outputs general tactile embeddings. Right: UniTouch (CVPR 2024) - contrastive learning binding touch to vision/language/audio, cross-modal alignment, zero-shot transfer. Center: shared output showing downstream tasks (grasp, slip, texture). Architecture diagrams with encoder blocks, loss functions. 4K, technical." \
  technical "assets/figures/ch03/fig_3_6_foundation_models_technical.png"
gen "Sparsh vs UniTouch foundation model architectures on dark background. Glowing neural network blocks, neon connections." \
  darkmode "assets/figures/ch03/fig_3_6_foundation_models_darkmode.png"
gen "Black and white comparison of Sparsh and UniTouch architectures. Simple block diagrams, academic grayscale." \
  academic "assets/figures/ch03/fig_3_6_foundation_models_academic.png" "1024x768"

echo "=== CHAPTER 4 ==="

# Fig 4.1: Gripper vs dexterous hand spectrum
gen "Design trade-off spectrum from parallel-jaw grippers to dexterous hands. Left: simple 2-finger parallel gripper (1 DoF, low cost, high reliability). Middle: adaptive grippers (Robotiq 3-finger, soft grippers). Right: full dexterous hands (Shadow Hand 24 DoF, Allegro 16 DoF). X-axis: DoF increasing. Y-axis: complexity/cost. Trade-off annotations: simplicity vs dexterity, reliability vs capability. 4K, technical diagram." \
  technical "assets/figures/ch04/fig_4_1_gripper_spectrum_technical.png"
gen "Gripper to dexterous hand spectrum on dark background. Gradient from simple to complex, neon style." \
  darkmode "assets/figures/ch04/fig_4_1_gripper_spectrum_darkmode.png"
gen "Black and white spectrum from parallel gripper to dexterous hand. Simple line drawings, academic." \
  academic "assets/figures/ch04/fig_4_1_gripper_spectrum_academic.png" "1024x768"

# Fig 4.2: Open-source hand cost-performance comparison
gen "Scatter plot comparing open-source robot hands. X-axis: cost (USD, log scale). Y-axis: total DoF. Points: Shadow Hand ($100K, 24 DoF), Allegro Hand ($15K, 16 DoF), LEAP Hand ($2K, 16 DoF), ISyHand ($500, 12 DoF). Each point has small hand illustration. Annotations: cost reduction trend arrow, performance maintained note. Color-coded by actuation type. Pareto frontier line. 4K, publication quality." \
  technical "assets/figures/ch04/fig_4_2_hand_cost_performance_technical.png"
gen "Robot hand cost vs performance scatter on dark background. Glowing points, neon labels. Dark theme." \
  darkmode "assets/figures/ch04/fig_4_2_hand_cost_performance_darkmode.png"
gen "Black and white scatter plot of robot hand cost vs DoF. Simple points with labels, academic." \
  academic "assets/figures/ch04/fig_4_2_hand_cost_performance_academic.png" "1024x768"

# Fig 4.3: Tendon-driven hand comparison
gen "Technical cross-section comparison of three tendon-driven robot hands. (1) SoftHand: single synergy tendon, adaptive underactuation, simple tendon routing. (2) ORCA: dual-tendon per finger, antagonistic design, variable impedance. (3) CRAFT: configurable tendon system, modular routing patterns. Each shows: finger cross-section, tendon paths (colored lines), pulley locations, actuation mechanism. Clean engineering drawing style, 4K." \
  technical "assets/figures/ch04/fig_4_3_tendon_hands_technical.png"
gen "Three tendon-driven hand cross-sections on dark background. Colored tendon paths glowing, neon style." \
  darkmode "assets/figures/ch04/fig_4_3_tendon_hands_darkmode.png"
gen "Black and white cross-sections of SoftHand, ORCA, CRAFT tendon routing. Simple line drawings, academic." \
  academic "assets/figures/ch04/fig_4_3_tendon_hands_academic.png" "1024x768"

# Fig 4.4: Four design axes
gen "Radar chart showing four key design axes of robot hands. Axes: (1) DoF/Dexterity (2-24), (2) Actuation (direct drive to tendon), (3) Compliance (rigid to soft), (4) Cost ($100 to $100K). Four overlapping radar profiles for representative hands: Shadow (high DoF, high cost), LEAP (balanced), SoftHand (high compliance, low DoF), Allegro (moderate all). Clean radar chart with legend, 4K, publication quality." \
  technical "assets/figures/ch04/fig_4_4_design_axes_technical.png"
gen "Robot hand design axes radar chart on dark background. Glowing polygon profiles, neon colors." \
  darkmode "assets/figures/ch04/fig_4_4_design_axes_darkmode.png"
gen "Black and white radar chart of robot hand design axes. Simple line profiles, academic grayscale." \
  academic "assets/figures/ch04/fig_4_4_design_axes_academic.png" "1024x768"

# Fig 4.5: Sensor integration strategies
gen "Comparison of sensor integration strategies in two robot hands. Left: F-TAC Hand (2025) - tactile sensors on all fingertips and palm pads, 17 sensors total, full coverage approach. Right: ORCA Hand (2025) - selective sensor placement on key contact surfaces, strategic coverage with fewer sensors. Diagrams show sensor locations highlighted on hand outlines. Bottom: comparison table of coverage area, sensor count, weight penalty, signal routing complexity. 4K, technical." \
  technical "assets/figures/ch04/fig_4_5_sensor_integration_technical.png"
gen "F-TAC vs ORCA sensor integration on dark background. Glowing sensor locations on hand outlines. Dark themed." \
  darkmode "assets/figures/ch04/fig_4_5_sensor_integration_darkmode.png"
gen "Black and white comparison of F-TAC and ORCA sensor layouts. Simple hand outlines with marked sensors, academic." \
  academic "assets/figures/ch04/fig_4_5_sensor_integration_academic.png" "1024x768"

# Fig 4.6: Allegro Hand research ecosystem
gen "Ecosystem diagram centered on Allegro Hand, showing research projects built on it. Center: Allegro Hand photo/illustration. Radiating connections to: DeXtreme (NVIDIA, sim-to-real RL), RGMC (multimodal grasping benchmark), D(R,O) Grasp (dexterous grasp planning), In-hand rotation studies, Various university labs. Each project box shows: name, institution, year, key contribution. Network/constellation layout, 4K, technical." \
  technical "assets/figures/ch04/fig_4_6_allegro_ecosystem_technical.png"
gen "Allegro Hand research ecosystem on dark background. Central hand with radiating project connections, neon glow." \
  darkmode "assets/figures/ch04/fig_4_6_allegro_ecosystem_darkmode.png"
gen "Black and white Allegro Hand ecosystem diagram. Central hand with project boxes connected by lines, academic." \
  academic "assets/figures/ch04/fig_4_6_allegro_ecosystem_academic.png" "1024x768"

echo "=== CHAPTER 5 ==="

# Fig 5.1: Underactuation shape adaptation
gen "Sequential diagram showing underactuated finger grasping different objects. Three rows: (1) Cylindrical object - finger wraps around uniformly. (2) Irregular object - finger adapts to contour. (3) Flat object - finger conforms to surface. Each row shows 4 time steps from initial contact to stable grasp. Single actuator driving multiple joints through differential mechanism. Labels: joint positions, contact forces, tendon tension. 4K, technical illustration." \
  technical "assets/figures/ch05/fig_5_1_underactuation_technical.png"
gen "Underactuated finger grasping sequence on dark background. Glowing finger outlines, neon contact forces." \
  darkmode "assets/figures/ch05/fig_5_1_underactuation_darkmode.png"
gen "Black and white underactuated finger adaptation sequence. Simple line drawings of finger conforming to objects, academic." \
  academic "assets/figures/ch05/fig_5_1_underactuation_academic.png" "1024x768"

# Fig 5.2: Variable stiffness mechanisms
gen "Four-panel diagram of variable stiffness actuator implementations. Panel 1: Parallel beam - two beams with adjustable overlap, stiffness changes with engagement length. Panel 2: Pneumatic - air chamber with variable pressure, soft at low pressure, rigid at high. Panel 3: SMA+SMP - shape memory alloy wires in shape memory polymer matrix, temperature-activated stiffness change. Panel 4: Particle jamming - granular material in membrane, vacuum creates rigid structure. Each panel: schematic, stiffness range bar, key advantage. 4K, technical." \
  technical "assets/figures/ch05/fig_5_2_variable_stiffness_technical.png"
gen "Four variable stiffness mechanisms on dark background. Glowing schematics, neon annotations. Dark themed." \
  darkmode "assets/figures/ch05/fig_5_2_variable_stiffness_darkmode.png"
gen "Black and white four variable stiffness mechanisms. Simple diagrams with labels, academic grayscale." \
  academic "assets/figures/ch05/fig_5_2_variable_stiffness_academic.png" "1024x768"

# Fig 5.3: Active belt mechanism
gen "Technical diagram of active belt/surface mechanism for robot finger. Step-by-step: (1) Gripper contacts object normally. (2) Belt on finger surface activates, creating tangential motion. (3) Object slides along finger while contact is maintained. (4) Object repositioned without releasing. Cross-section showing belt drive motor, contact surface, object. Applications: reorientation without regrasping, sorting. 4K, technical illustration." \
  technical "assets/figures/ch05/fig_5_3_active_belt_technical.png"
gen "Active belt mechanism on dark background. Glowing belt motion arrows, neon finger cross-section. Dark themed." \
  darkmode "assets/figures/ch05/fig_5_3_active_belt_darkmode.png"
gen "Black and white active belt mechanism diagram. Simple cross-section with motion arrows, academic." \
  academic "assets/figures/ch05/fig_5_3_active_belt_academic.png" "1024x768"

# Fig 5.4: Integrated mechanism architecture
gen "System architecture diagram showing temporal integration of three mechanisms. Timeline from left to right: Phase 1 'Approach' - underactuated fingers conform to object shape. Phase 2 'Grasp' - variable stiffness actuators lock to maintain grip. Phase 3 'Manipulate' - active belt repositions object in hand. Vertical: control signals, sensor feedback loops. Arrows showing state transitions and triggers. Block diagram with mechanism icons, 4K, technical." \
  technical "assets/figures/ch05/fig_5_4_integrated_architecture_technical.png"
gen "Three-mechanism integration timeline on dark background. Glowing phase blocks, neon transitions." \
  darkmode "assets/figures/ch05/fig_5_4_integrated_architecture_darkmode.png"
gen "Black and white three-phase mechanism integration diagram. Simple blocks and arrows, academic." \
  academic "assets/figures/ch05/fig_5_4_integrated_architecture_academic.png" "1024x768"

# Fig 5.5: Factory automation target tasks
gen "Three industrial manipulation scenarios requiring intelligent mechanisms. Panel 1 'Thin Objects': picking a single sheet from a stack, showing difficulty of edge detection and separation. Panel 2 'Multiple Objects': bin picking with varied items, showing adaptive grasping challenge. Panel 3 'Reposition/Align': orienting a part for assembly, showing in-hand manipulation need. Each panel: task illustration, required mechanism (underactuation/VSA/belt), success criteria. 4K, technical." \
  technical "assets/figures/ch05/fig_5_5_factory_tasks_technical.png"
gen "Three factory automation scenarios on dark background. Glowing task illustrations, neon labels." \
  darkmode "assets/figures/ch05/fig_5_5_factory_tasks_darkmode.png"
gen "Black and white three factory manipulation scenarios. Simple task illustrations, academic grayscale." \
  academic "assets/figures/ch05/fig_5_5_factory_tasks_academic.png" "1024x768"

# Fig 5.6: Continuous vs discontinuous contact
gen "State transition diagram comparing continuous and discontinuous contact manipulation. Top: Discontinuous - grasp, release, regrasp cycle with free-flight phase, stability risk at each transition. Bottom: Continuous - object stays in contact throughout, sliding/rolling/pivoting transitions. State machine diagram with states: stable grasp, sliding, rolling, pivoting, free. Risk indicator at each transition. Stability comparison metrics. 4K, technical diagram." \
  technical "assets/figures/ch05/fig_5_6_contact_continuity_technical.png"
gen "Continuous vs discontinuous contact states on dark background. Glowing state machine, neon transitions." \
  darkmode "assets/figures/ch05/fig_5_6_contact_continuity_darkmode.png"
gen "Black and white state diagram of continuous vs discontinuous contact. Simple circles and arrows, academic." \
  academic "assets/figures/ch05/fig_5_6_contact_continuity_academic.png" "1024x768"

echo "=== CHAPTER 6 ==="

# Fig 6.1: MANO hand model
gen "Technical diagram of MANO parametric hand model. Left: wireframe mesh of hand showing 778 vertices and triangular faces. Center: skeleton showing 16 joints with labeled joint angles (theta parameters). Right: PCA shape space visualization showing first 3 principal components morphing hand shape (thin to thick, short to long fingers). Labels: pose parameters (theta), shape parameters (beta), output mesh. Reference: Romero et al. 2017. 4K, technical illustration." \
  technical "assets/figures/ch06/fig_6_1_mano_model_technical.png"
gen "MANO hand model on dark background. Glowing wireframe mesh, neon joint skeleton, PCA morphing." \
  darkmode "assets/figures/ch06/fig_6_1_mano_model_darkmode.png"
gen "Black and white MANO hand model. Wireframe, skeleton, shape PCA. Simple academic figure." \
  academic "assets/figures/ch06/fig_6_1_mano_model_academic.png" "1024x768"

# Fig 6.2: Motion tracking gloves comparison
gen "Comparison of four motion tracking glove technologies for hand data collection. (1) Stretchable sensor gloves - fabric with embedded strain sensors, low cost, limited accuracy. (2) Rokoko - inertial measurement units on each finger, wireless, moderate accuracy. (3) Manus - optical-inertial hybrid, high accuracy, VR compatible. (4) StretchSense - capacitive stretch sensors, thin form factor, good for dexterous tasks. Each glove shown with specs: DoF tracked, accuracy, latency, cost. 4K, technical comparison." \
  technical "assets/figures/ch06/fig_6_2_tracking_gloves_technical.png"
gen "Four motion tracking gloves comparison on dark background. Glowing glove outlines, neon sensor highlights." \
  darkmode "assets/figures/ch06/fig_6_2_tracking_gloves_darkmode.png"
gen "Black and white comparison of four tracking gloves. Simple glove outlines with sensor locations, academic." \
  academic "assets/figures/ch06/fig_6_2_tracking_gloves_academic.png" "1024x768"

# Fig 6.3: OSMO Embodiment Bridge
gen "Concept diagram of OSMO glove as Embodiment Bridge. Two panels connected by central glove icon. Left: Human wearing OSMO glove, performing manipulation task, sensor data flows from glove. Right: Same OSMO glove worn by robot hand, replaying captured motion. Center: bidirectional arrow labeled 'Embodiment Bridge' - same physical interface bridges human-robot gap. Data flow: human motion -> glove sensors -> robot actuators. Reference: OSMO 2025. 4K, technical." \
  technical "assets/figures/ch06/fig_6_3_osmo_bridge_technical.png"
gen "OSMO Embodiment Bridge on dark background. Human-glove-robot connection with glowing data flow. Dark themed." \
  darkmode "assets/figures/ch06/fig_6_3_osmo_bridge_darkmode.png"
gen "Black and white OSMO Embodiment Bridge concept. Human-glove-robot diagram, simple academic style." \
  academic "assets/figures/ch06/fig_6_3_osmo_bridge_academic.png" "1024x768"

# Fig 6.4: DexUMI dual gap
gen "DexUMI system resolving two gaps. Top flow: Kinematic Gap - human hand motion captured via exoskeleton, then retargeted to robot hand kinematics. Bottom flow: Visual Gap - camera sees exoskeleton/human hand, SAM2 inpainting removes human hand and replaces with robot hand appearance. Combined: robot learns from visually consistent demonstrations. Before/after image pair showing original (human hand visible) and inpainted (robot hand replacing). Reference: DexUMI 2025. 4K, technical." \
  technical "assets/figures/ch06/fig_6_4_dexumi_technical.png"
gen "DexUMI dual gap resolution on dark background. Glowing pipeline arrows, before/after, neon style." \
  darkmode "assets/figures/ch06/fig_6_4_dexumi_darkmode.png"
gen "Black and white DexUMI dual gap diagram. Kinematic and visual gap flows, simple academic." \
  academic "assets/figures/ch06/fig_6_4_dexumi_academic.png" "1024x768"

# Fig 6.5: Data collection spectrum
gen "Horizontal spectrum of human hand data collection methods ordered by throughput. Left (low throughput, high fidelity): Teleoperation with haptic feedback, operator controls robot directly, ~100 demos/day. Center: Exoskeleton capture, motion recorded in-hand, ~500 demos/day. Right (high throughput, lower fidelity): Internet video mining, YouTube/egocentric videos processed by hand pose estimation, ~10000+ clips available. Trade-off arrows: fidelity decreases, scale increases. 4K, technical diagram." \
  technical "assets/figures/ch06/fig_6_5_collection_spectrum_technical.png"
gen "Data collection spectrum on dark background: teleoperation to internet video. Glowing gradient, neon labels." \
  darkmode "assets/figures/ch06/fig_6_5_collection_spectrum_darkmode.png"
gen "Black and white data collection method spectrum. Simple horizontal scale with methods, academic." \
  academic "assets/figures/ch06/fig_6_5_collection_spectrum_academic.png" "1024x768"

# Fig 6.6: Teleoperation systems comparison
gen "Four teleoperation systems compared side by side. (1) AnyTeleop: vision-based, markerless hand tracking, any robot target. (2) DexPilot: glove-based, finger joint mapping, optimized for Shadow Hand. (3) Bunny-VisionPro: Apple Vision Pro headset for immersive teleoperation, spatial hand tracking. (4) DexCap: wearable exoskeleton with finger encoders, portable capture. Each system: setup diagram, input device, target robot, key metric (latency/accuracy). 4K, technical comparison." \
  technical "assets/figures/ch06/fig_6_6_teleop_comparison_technical.png"
gen "Four teleoperation systems on dark background: AnyTeleop, DexPilot, Bunny-VisionPro, DexCap. Neon panels." \
  darkmode "assets/figures/ch06/fig_6_6_teleop_comparison_darkmode.png"
gen "Black and white comparison of four teleoperation systems. Simple setup diagrams, academic grayscale." \
  academic "assets/figures/ch06/fig_6_6_teleop_comparison_academic.png" "1024x768"

echo "=== CHAPTER 7 ==="

# Fig 7.1: Diffusion Policy vs ACT
gen "Side-by-side architecture comparison of two imitation learning approaches. Left: Diffusion Policy - noisy action sequence gradually denoised through U-Net, conditioned on observation, iterative refinement producing smooth trajectories. Right: ACT/ALOHA - Conditional VAE with transformer encoder/decoder, observation encoded, latent sampled, action chunk decoded in one pass. Both: input (camera + proprioception), output (action trajectory). Key differences highlighted: iterative vs single-pass, stochastic vs deterministic. 4K, technical diagram." \
  technical "assets/figures/ch07/fig_7_1_diffusion_vs_act_technical.png"
gen "Diffusion Policy vs ACT architectures on dark background. Glowing neural network blocks, neon arrows." \
  darkmode "assets/figures/ch07/fig_7_1_diffusion_vs_act_darkmode.png"
gen "Black and white Diffusion Policy vs ACT comparison. Simple block diagrams, academic grayscale." \
  academic "assets/figures/ch07/fig_7_1_diffusion_vs_act_academic.png" "1024x768"

# Fig 7.2: Tactile RL pipeline
gen "Three-stage pipeline for tactile reinforcement learning. Stage 1 'Simulation': physics engine (Isaac Gym / MuJoCo) with simulated tactile sensors, agent explores in parallel environments, reward shaping. Stage 2 'Domain Randomization': sensor noise, object shape/mass/friction variation, visual randomization. Stage 3 'Zero-Shot Transfer': trained policy directly deployed on real robot with real tactile sensors, no fine-tuning needed. Pipeline flows left to right with large arrows. 4K, technical diagram." \
  technical "assets/figures/ch07/fig_7_2_tactile_rl_pipeline_technical.png"
gen "Tactile RL pipeline on dark background: sim -> domain randomization -> real transfer. Glowing stages, neon flow." \
  darkmode "assets/figures/ch07/fig_7_2_tactile_rl_pipeline_darkmode.png"
gen "Black and white three-stage tactile RL pipeline. Simple block flow diagram, academic." \
  academic "assets/figures/ch07/fig_7_2_tactile_rl_pipeline_academic.png" "1024x768"

# Fig 7.3: PP-Tac system
gen "System diagram of PP-Tac (RSS 2025). Pipeline: R-Tac optical tactile sensor on robot finger captures contact image -> slip detection module identifies incipient slip -> signal feeds into Diffusion Policy that generates corrective gripper actions -> robot adjusts grasp in real-time. Feedback loop from tactile sensor back to policy. Key components labeled: R-Tac sensor, slip classifier, diffusion denoising process, robot arm. Reference: PP-Tac RSS 2025. 4K, technical." \
  technical "assets/figures/ch07/fig_7_3_pptac_technical.png"
gen "PP-Tac system pipeline on dark background. Glowing sensor-to-policy flow, neon R-Tac highlight." \
  darkmode "assets/figures/ch07/fig_7_3_pptac_darkmode.png"
gen "Black and white PP-Tac system diagram. Simple pipeline from sensor to policy, academic." \
  academic "assets/figures/ch07/fig_7_3_pptac_academic.png" "1024x768"

# Fig 7.4: Force-informed learning
gen "Comparison of two force-informed learning approaches. Left: DexForce - spring model between fingertip and object, virtual spring force computed from displacement, force integrated into policy observation. Right: ForceVLA - Mixture of Experts (MoE) module fusing force/torque signals with visual features, expert gating mechanism, force as first-class modality. Both: input modalities (vision, force, proprioception), how force is represented, output actions. 4K, technical." \
  technical "assets/figures/ch07/fig_7_4_force_learning_technical.png"
gen "DexForce vs ForceVLA on dark background. Glowing spring model and MoE diagram, neon style." \
  darkmode "assets/figures/ch07/fig_7_4_force_learning_darkmode.png"
gen "Black and white DexForce vs ForceVLA comparison. Simple block diagrams, academic grayscale." \
  academic "assets/figures/ch07/fig_7_4_force_learning_academic.png" "1024x768"

# Fig 7.5: IL vs RL vs Optimization
gen "Venn diagram or three-column comparison of manipulation learning approaches. Column 1 'Imitation Learning': learns from demonstrations, data-efficient, limited by demo quality, best for structured tasks. Column 2 'Reinforcement Learning': learns from reward, can exceed human performance, sample-inefficient, best for dynamic tasks. Column 3 'Optimization-Based': trajectory optimization, model-based, guaranteed constraints, best for precision tasks. Overlap regions showing hybrid approaches. Trade-off axes: data efficiency vs exploration, generalization vs precision. 4K." \
  technical "assets/figures/ch07/fig_7_5_il_rl_optimization_technical.png"
gen "IL vs RL vs Optimization comparison on dark background. Three glowing columns with overlaps, neon colors." \
  darkmode "assets/figures/ch07/fig_7_5_il_rl_optimization_darkmode.png"
gen "Black and white IL vs RL vs Optimization three-column comparison. Simple labeled boxes, academic." \
  academic "assets/figures/ch07/fig_7_5_il_rl_optimization_academic.png" "1024x768"

# Fig 7.6: Tactile manipulation landscape
gen "Comprehensive landscape map of tactile manipulation learning. Central node 'Tactile Manipulation'. Five major branches: (1) Imitation Learning (Diffusion Policy, ACT, visuotactile IL). (2) Reinforcement Learning (sim-to-real, tactile reward shaping). (3) Optimization (trajectory opt, model predictive control). (4) Tactile-Only approaches (slip control, force-guided). (5) Multimodal Fusion (vision+tactile, VLA+touch). Each branch lists 2-3 key papers. Connecting lines show relationships. Mind-map layout, 4K." \
  technical "assets/figures/ch07/fig_7_6_tactile_landscape_technical.png"
gen "Tactile manipulation learning landscape on dark background. Glowing mind-map branches, neon nodes." \
  darkmode "assets/figures/ch07/fig_7_6_tactile_landscape_darkmode.png"
gen "Black and white tactile manipulation landscape mind-map. Simple nodes and connections, academic." \
  academic "assets/figures/ch07/fig_7_6_tactile_landscape_academic.png" "1024x768"

echo "All Ch03-Ch07 figures complete!"
