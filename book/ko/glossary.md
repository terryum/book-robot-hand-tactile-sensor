---
title: "용어집 (Glossary)"
date: "2026-04-01"
last_updated: "2026-04-01"
---

# 용어집 (Glossary)

## A

- **ACT (Action Chunking with Transformers)**: Transformer 기반 행동 청킹 — 시연에서 연속 행동 시퀀스를 학습 (Ch7)
- **ADR (Automatic Domain Randomization)**: 자동 도메인 랜덤화 — 물리/비물리 파라미터를 자동으로 변화시키는 sim-to-real 전략 (Ch9)
- **ALOHA**: 저비용 양손 원격 조작 하드웨어 ($20K 이하) (Ch7, Ch11)

## B

- **Binary tactile sensor**: 이진 촉각 센서 — 접촉 여부만 감지 (0/1). 해상도보다 커버리지가 중요할 때 사용 (Ch7)

## C

- **Capacitive sensor (정전용량식 센서)**: 두 전극 간 정전용량 변화로 접촉을 측정하는 센서 (Ch2)
- **Canonical representation (정규 표현)**: 센서 독립적인 표준 좌표계로의 데이터 변환 (Ch3)
- **Compliance (유연성)**: 외력에 대한 기계적 순응. 접촉이 풍부한 조작에서 필수 (Ch4, Ch5)
- **Contrastive learning (대조 학습)**: 유사 쌍을 가깝게, 비유사 쌍을 멀리 배치하는 학습 방법 (Ch3)
- **Cross-embodiment gap (교차 체현 격차)**: 인간과 로봇 간 운동학적/시각적/촉각적 차이 (Ch10)

## D

- **Dexterous manipulation (다지 조작)**: 다지 핸드를 이용한 정밀 물체 조작 — in-hand rotation, assembly 등 (Ch7)
- **Diffusion Policy (확산 정책)**: 조건부 잡음 제거 확산 과정으로 행동을 생성하는 정책 학습 방법 (Ch7)
- **DoF (Degrees of Freedom, 자유도)**: 관절의 독립적 운동 축 수. 인간 손: ~27 DoF (Ch4)
- **Domain Randomization (도메인 랜덤화)**: 시뮬레이션 파라미터를 랜덤화하여 정책의 견고성을 높이는 기법 (Ch9)

## E

- **Embodiment Retargeting**: 한 체현(예: 인간)의 동작을 다른 체현(예: 로봇)으로 매핑 (Ch10)
- **E-skin (전자 피부)**: 촉각 센서가 통합된 유연 전자 기판 (Ch2)

## F

- **FEM (Finite Element Method, 유한 요소법)**: 변형 시뮬레이션을 위한 수치 해석 방법 (Ch3, Ch9)
- **Flow Matching**: 연속 정규화 흐름으로 행동 분포를 학습하는 방법 — pi0의 핵심 기법 (Ch8)
- **Force-torque sensor (힘-토크 센서)**: 6축(3힘 + 3토크) 힘을 측정하는 센서 (Ch7)
- **Foundation Model**: 대규모 데이터로 사전학습된 범용 모델 — Sparsh(촉각), pi0(VLA) (Ch3, Ch8)

## G

- **GelSight**: MIT에서 개발된 광도 입체법 기반 비전 촉각 센서 (Ch2)

## I

- **IL (Imitation Learning, 모방 학습)**: 인간 시연을 직접 모방하여 정책을 학습 (Ch7)
- **Impedance control (임피던스 제어)**: 힘과 변위의 관계를 조절하는 제어 방법 [Hogan, 1985] (Ch7)
- **In-hand manipulation (손안 조작)**: 파지 상태에서 물체의 위치/자세를 변경 (Ch7)

## K

- **Kinesthetic teaching (운동학적 시연)**: 인간이 로봇을 직접 움직여 동작을 시연하는 방법 (Ch6)

## M

- **MANO**: 1,000개 3D 스캔으로 학습한 통계적 인간 손 모델 (778 정점, 16 관절) (Ch6)
- **Mechanoreceptor (기계적 수용기)**: 접촉/압력/진동을 감지하는 생물학적 센서 — Merkel, Meissner, Ruffini, Pacinian (Ch1)
- **MoE (Mixture of Experts)**: 여러 전문가 네트워크를 동적으로 라우팅하는 아키텍처 — ForceVLA (Ch8)

## N

- **Neuromorphic sensor (신경형태학적 센서)**: 생물학적 신경계를 모방한 이벤트 구동 센서 (Ch2)

## O

- **Open X-Embodiment**: 34개 연구실의 1M+ 궤적을 통합한 최대 오픈소스 로봇 데이터셋 (Ch8)

## P

- **Particle jamming (입자 잼)**: 입자 밀집으로 유연→강성 전환하는 메커니즘 (Ch5)
- **Photometric stereo (광도 입체법)**: 다방향 조명과 카메라로 3D 형상을 복원하는 방법 — GelSight의 핵심 (Ch2)
- **Physical AI**: 물리 세계를 이해하고 상호작용하는 AI — Foundation Models + 시뮬레이션 + 센서의 수렴 (Ch12)
- **Piezoresistive sensor (압저항식 센서)**: 접촉에 의한 저항 변화를 측정하는 센서 (Ch2)
- **Point cloud (포인트 클라우드)**: 3D 좌표 집합으로 표현된 촉각/시각 데이터 (Ch3)

## R

- **RL (Reinforcement Learning, 강화학습)**: 보상 최대화를 통한 정책 학습 (Ch7)
- **Retargeting**: → Embodiment Retargeting 참조

## S

- **Shear force (전단력)**: 표면에 평행한 방향의 힘 — 미끄러짐 감지에 필수 (Ch2)
- **Sim-to-Real**: 시뮬레이션에서 학습한 정책을 실제 로봇에 전이 (Ch9)
- **Slip detection (미끄러짐 감지)**: 물체가 손에서 미끄러지는 것을 감지 — 전단력 모니터링으로 구현 (Ch1, Ch2)
- **Synergy (시너지)**: 여러 관절의 협조 운동 패턴 — PCA 기반 차원 축소 (Ch5)

## T

- **Tactile foundation model (촉각 Foundation Model)**: 대규모 촉각 데이터로 사전학습된 범용 표현 — Sparsh, UniTouch (Ch3)
- **Taxel**: 촉각 감지점 (tactile pixel) — Digit 360: 8.3M taxels (Ch2)
- **Teleoperation (원격 조작)**: 인간이 원격으로 로봇을 조종하여 데이터 수집 (Ch6)
- **Tendon-driven (건 구동)**: 건(tendon)으로 힘을 전달하는 구동 방식 — SoftHand, ORCA (Ch4, Ch5)
- **Torque control (토크 제어)**: 관절 토크를 직접 제어 — contact-rich 환경에서 필수 (Ch4)

## U

- **Underactuation (부족 구동)**: 구동기 수 < 관절 수인 설계 — 수동적 형상 적응 (Ch5)
- **UV map**: 3D 표면을 2D로 전개한 좌표 맵 — MANO UV map for UniTacHand (Ch3, Ch10)

## V

- **VLA (Vision-Language-Action)**: 시각-언어-행동 모델 — RT-2, pi0, Gemini Robotics (Ch8)
- **VSA (Variable Stiffness Actuator, 가변 강성 구동기)**: 유연↔강성 전환 가능한 구동기 (Ch5)
- **Visuo-tactile (시각-촉각)**: 시각과 촉각 정보의 결합 — Robot Synesthesia, 3D-ViTac (Ch3, Ch11)
