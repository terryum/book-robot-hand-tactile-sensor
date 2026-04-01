---
title: "Glossary"
date: "2026-04-01"
last_updated: "2026-04-01"
---

# Glossary

## A

- **ACT (Action Chunking with Transformers)**: Policy learning method that predicts continuous action sequences from demonstrations (Ch7)
- **ADR (Automatic Domain Randomization)**: Sim-to-real strategy that automatically varies physics/non-physics parameters (Ch9)
- **ALOHA**: Low-cost (<$20K) bimanual teleoperation hardware (Ch7, Ch11)

## B

- **Binary tactile sensor**: Touch sensor detecting only contact/no-contact (0/1). Used when coverage matters more than resolution (Ch7)

## C

- **Capacitive sensor**: Measures contact via capacitance change between electrodes (Ch2)
- **Canonical representation**: Sensor-independent data transformation to a standard coordinate frame (Ch3)
- **Compliance**: Mechanical yielding to external forces. Essential for contact-rich manipulation (Ch4, Ch5)
- **Contrastive learning**: Training method placing similar pairs close and dissimilar pairs far in embedding space (Ch3)
- **Cross-embodiment gap**: Kinematic, visual, and tactile differences between human and robot (Ch10)

## D

- **Dexterous manipulation**: Precise object manipulation using multi-fingered hands — in-hand rotation, assembly, etc. (Ch7)
- **Diffusion Policy**: Policy learning via conditional denoising diffusion process for action generation (Ch7)
- **DoF (Degrees of Freedom)**: Number of independent motion axes in joints. Human hand: ~27 DoF (Ch4)
- **Domain Randomization**: Randomizing simulation parameters to increase policy robustness (Ch9)

## E

- **Embodiment Retargeting**: Mapping motion from one embodiment (e.g., human) to another (e.g., robot) (Ch10)
- **E-skin**: Flexible electronic substrate with integrated tactile sensors (Ch2)

## F

- **FEM (Finite Element Method)**: Numerical method for deformation simulation (Ch3, Ch9)
- **Flow Matching**: Learning action distributions via continuous normalizing flows — core technique of pi0 (Ch8)
- **Force-torque sensor**: 6-axis sensor measuring 3 forces + 3 torques (Ch7)
- **Foundation Model**: General-purpose model pretrained on large-scale data — Sparsh (tactile), pi0 (VLA) (Ch3, Ch8)

## G

- **GelSight**: Photometric stereo-based vision tactile sensor developed at MIT (Ch2)

## I

- **IL (Imitation Learning)**: Learning policies by directly mimicking human demonstrations (Ch7)
- **Impedance control**: Control method governing the force-displacement relationship [Hogan, 1985] (Ch7)
- **In-hand manipulation**: Changing object pose/position within a grasp (Ch7)

## K

- **Kinesthetic teaching**: Demonstrating motion by physically guiding the robot (Ch6)

## M

- **MANO**: Statistical human hand model learned from 1,000 3D scans (778 vertices, 16 joints) (Ch6)
- **Mechanoreceptor**: Biological sensor for contact/pressure/vibration — Merkel, Meissner, Ruffini, Pacinian (Ch1)
- **MoE (Mixture of Experts)**: Architecture dynamically routing inputs across expert networks — ForceVLA (Ch8)

## N

- **Neuromorphic sensor**: Event-driven sensor inspired by the biological nervous system (Ch2)

## O

- **Open X-Embodiment**: Largest open-source robot dataset — 1M+ trajectories from 34 labs, 22 embodiments (Ch8)

## P

- **Particle jamming**: Stiffness switching via particle densification — soft to rigid transition (Ch5)
- **Photometric stereo**: 3D shape recovery from multi-directional illumination — core of GelSight (Ch2)
- **Physical AI**: AI systems understanding and interacting with the physical world — convergence of foundation models + simulation + sensors (Ch12)
- **Piezoresistive sensor**: Measures contact via resistance change in material (Ch2)
- **Point cloud**: Tactile/visual data represented as a set of 3D coordinates (Ch3)

## R

- **RL (Reinforcement Learning)**: Policy learning through reward maximization (Ch7)
- **Retargeting**: See Embodiment Retargeting

## S

- **Shear force**: Force parallel to the contact surface — essential for slip detection (Ch2)
- **Sim-to-Real**: Transferring simulation-trained policies to physical robots (Ch9)
- **Slip detection**: Detecting object slippage from the hand — implemented via shear force monitoring (Ch1, Ch2)
- **Synergy**: Coordinated multi-joint motion pattern — PCA-based dimensionality reduction (Ch5)

## T

- **Tactile foundation model**: General-purpose representation pretrained on large-scale tactile data — Sparsh, UniTouch (Ch3)
- **Taxel**: Tactile pixel — single sensing point. Digit 360: 8.3M taxels (Ch2)
- **Teleoperation**: Remotely controlling a robot to collect demonstration data (Ch6)
- **Tendon-driven**: Actuation via tendons transmitting force — SoftHand, ORCA (Ch4, Ch5)
- **Torque control**: Direct joint torque control — essential for contact-rich environments (Ch4)

## U

- **Underactuation**: Design with fewer actuators than joints — passive shape adaptation (Ch5)
- **UV map**: 2D unfolding of a 3D surface — MANO UV map for UniTacHand (Ch3, Ch10)

## V

- **VLA (Vision-Language-Action)**: Models integrating vision, language, and action — RT-2, pi0, Gemini Robotics (Ch8)
- **VSA (Variable Stiffness Actuator)**: Actuator capable of switching between compliant and stiff states (Ch5)
- **Visuo-tactile**: Combining visual and tactile information — Robot Synesthesia, 3D-ViTac (Ch3, Ch11)
