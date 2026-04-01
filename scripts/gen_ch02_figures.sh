#!/bin/bash
export GEMINI_API_KEY=$(cat .env.local | grep GEMINI_API_KEY | cut -d= -f2)
SCRIPT=".claude/skills/gemini-imagegen/scripts/generate_image.py"

# Fig 2.1: Five transduction principles
python3 $SCRIPT \
  --prompt "Comparison diagram of five tactile sensor transduction principles side by side. Five columns: (1) Piezoresistive - conductive rubber between electrodes, pressure changes resistance, simple circuit diagram. (2) Capacitive - two parallel plates with dielectric, force changes gap distance, labeled capacitor. (3) Optical/Vision-based - camera viewing deformed elastomer through LEDs, photometric stereo reconstruction. (4) Magnetic - magnetized skin over Hall-effect sensor array, deformation shifts magnetic field. (5) Piezoelectric - crystal generating charge under dynamic pressure, charge amplifier circuit. Each column has: principle diagram, key equation, pros/cons bullet. Clean labeled technical illustration, white background, 4K, publication quality." \
  --style technical --output "assets/figures/ch02/fig_2_1_transduction_principles_technical.png" --size "1536x1024"

python3 $SCRIPT \
  --prompt "Five tactile sensor transduction principles on dark background: piezoresistive, capacitive, optical, magnetic, piezoelectric. Neon glowing diagrams with bright colored lines. Dark themed." \
  --style darkmode --output "assets/figures/ch02/fig_2_1_transduction_principles_darkmode.png" --size "1536x1024"

python3 $SCRIPT \
  --prompt "Black and white comparison of five tactile transduction principles: piezoresistive, capacitive, optical, magnetic, piezoelectric. Simple line diagrams. Academic paper style, minimal, grayscale." \
  --style academic --output "assets/figures/ch02/fig_2_1_transduction_principles_academic.png" --size "1024x768"

# Fig 2.2: Vision-based sensor evolution
python3 $SCRIPT \
  --prompt "Evolution timeline of vision-based tactile sensors with detailed cross-sections. Four stages left to right: (1) GelSight 2017 - flat elastomer gel, RGB LEDs, single camera, photometric stereo. (2) GelSight Wedge 2021 - compact wedge shape fitting robot finger, angled mirror. (3) DIGIT 2020 - miniaturized finger form factor 20x27mm, integrated design. (4) Digit 360 2024 - hemispherical dome, 5 cameras, 18+ modalities, omnidirectional. Arrows showing progression with key specs (resolution, size, cost). 4K, technical diagram, publication quality." \
  --style technical --output "assets/figures/ch02/fig_2_2_vbts_evolution_technical.png" --size "1536x1024"

python3 $SCRIPT \
  --prompt "Vision-based tactile sensor evolution on dark background: GelSight -> Wedge -> DIGIT -> Digit 360. Glowing cross-sections, neon arrows. Dark themed." \
  --style darkmode --output "assets/figures/ch02/fig_2_2_vbts_evolution_darkmode.png" --size "1536x1024"

python3 $SCRIPT \
  --prompt "Black and white evolution of vision-based tactile sensors: GelSight, Wedge, DIGIT, Digit 360. Simple schematic cross-sections with arrows. Academic grayscale." \
  --style academic --output "assets/figures/ch02/fig_2_2_vbts_evolution_academic.png" --size "1024x768"

# Fig 2.3: Photometric stereo principle
python3 $SCRIPT \
  --prompt "Detailed technical diagram of photometric stereo principle in vision-based tactile sensors. Step-by-step: (1) Object presses against elastomer gel creating deformation. (2) RGB LEDs illuminate deformed surface from different angles (red, green, blue shown as colored arrows). (3) Camera captures combined light reflection. (4) Normal map computed from RGB channels. (5) 3D surface reconstructed via Poisson integration. Include: cross-section of sensor, light ray diagrams, sample normal map visualization (color sphere), sample depth map output. Clean technical illustration, white background, 4K, publication quality." \
  --style technical --output "assets/figures/ch02/fig_2_3_photometric_stereo_technical.png" --size "1536x1024"

python3 $SCRIPT \
  --prompt "Photometric stereo principle in tactile sensors on dark background. Glowing LEDs, camera, elastomer gel. Step-by-step 3D reconstruction. Neon style, dark themed." \
  --style darkmode --output "assets/figures/ch02/fig_2_3_photometric_stereo_darkmode.png" --size "1536x1024"

python3 $SCRIPT \
  --prompt "Black and white diagram of photometric stereo for tactile sensing. LED illumination angles, camera, gel surface, normal map reconstruction. Simple, academic style." \
  --style academic --output "assets/figures/ch02/fig_2_3_photometric_stereo_academic.png" --size "1024x768"

# Fig 2.4: Multi-axis force sensing
python3 $SCRIPT \
  --prompt "Technical diagram comparing normal force vs shear force in tactile sensing. Left: Normal force (Fz) - finger pressing straight down on sensor, force arrow pointing down, useful for grasp force measurement. Right: Shear force (Fx, Fy) - finger sliding on surface, horizontal force arrows, essential for slip detection. Center: 3D force vector showing Fx, Fy, Fz components on a taxel. Bottom: application examples - normal force for grasp stability, shear force for slip prevention. Color-coded: normal in blue, shear in red/green. 4K, technical diagram, white background." \
  --style technical --output "assets/figures/ch02/fig_2_4_multiaxis_force_technical.png" --size "1536x1024"

python3 $SCRIPT \
  --prompt "Normal vs shear force comparison in tactile sensing on dark background. 3D force vectors, glowing arrows. Normal force blue, shear force red/green. Dark themed, neon." \
  --style darkmode --output "assets/figures/ch02/fig_2_4_multiaxis_force_darkmode.png" --size "1536x1024"

python3 $SCRIPT \
  --prompt "Black and white diagram of normal vs shear force in tactile sensing. Force arrows, 3D vector, grasp scenarios. Simple academic style, grayscale." \
  --style academic --output "assets/figures/ch02/fig_2_4_multiaxis_force_academic.png" --size "1024x768"

# Fig 2.5: F-TAC Hand sensor layout
python3 $SCRIPT \
  --prompt "Technical diagram of F-TAC Hand sensor layout. Anthropomorphic robot hand with 17 tactile sensors highlighted. Show: (1) Top view of hand with sensor locations marked in color (fingertips, finger segments, palm). (2) Expanded view of one finger showing sensor integration. (3) Coverage map showing which hand surfaces have tactile sensing. Labels for each sensor location with type. Reference: F-TAC Hand, Nature Machine Intelligence 2025. 4K, technical illustration, white background, publication quality." \
  --style technical --output "assets/figures/ch02/fig_2_5_ftac_hand_technical.png" --size "1536x1024"

python3 $SCRIPT \
  --prompt "F-TAC Hand with 17 tactile sensors on dark background. Glowing sensor locations, neon hand outline. Coverage map. Dark themed technical illustration." \
  --style darkmode --output "assets/figures/ch02/fig_2_5_ftac_hand_darkmode.png" --size "1536x1024"

python3 $SCRIPT \
  --prompt "Black and white diagram of F-TAC Hand sensor layout. 17 tactile sensors marked on hand schematic. Simple line drawing, academic style, grayscale." \
  --style academic --output "assets/figures/ch02/fig_2_5_ftac_hand_academic.png" --size "1024x768"

# Fig 2.6: Next-gen sensor technologies
python3 $SCRIPT \
  --prompt "Three-panel diagram of next-generation tactile sensor technologies. Panel 1: Neuromorphic tactile sensor - event-driven sensing inspired by biological neurons, spike signals, low latency microsecond response. Panel 2: Self-healing electronic skin - polymer-based sensor that recovers from damage, before/after cut illustration, molecular structure. Panel 3: PBR-based sensor design - physically based rendering for optimizing sensor optical design in simulation before fabrication, virtual sensor testing. Each panel with title, key principle diagram, and advantage bullet. 4K, technical illustration, white background." \
  --style technical --output "assets/figures/ch02/fig_2_6_nextgen_sensors_technical.png" --size "1536x1024"

python3 $SCRIPT \
  --prompt "Next-gen tactile sensors on dark background: neuromorphic, self-healing e-skin, PBR simulation design. Three glowing panels, neon style, dark themed." \
  --style darkmode --output "assets/figures/ch02/fig_2_6_nextgen_sensors_darkmode.png" --size "1536x1024"

python3 $SCRIPT \
  --prompt "Black and white three-panel diagram: neuromorphic sensors, self-healing e-skin, PBR sensor design. Simple illustrations, academic grayscale." \
  --style academic --output "assets/figures/ch02/fig_2_6_nextgen_sensors_academic.png" --size "1024x768"

echo "Ch02 figures complete!"
