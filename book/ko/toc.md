---
title: "로봇 손의 정교한 조작을 위한 촉각 센싱: 종합 서베이 — 목차"
subtitle: "Tactile Sensing for Dexterous Robot Hand Manipulation: A Comprehensive Survey"
date: "2026-04-01"
last_updated: "2026-04-01"
chapters: 13
parts: 4
---

# 로봇 손의 정교한 조작을 위한 촉각 센싱: 종합 서베이 (Tactile Sensing for Dexterous Robot Hand Manipulation: A Comprehensive Survey)

> 촉각 센서, 로봇 핸드, 데이터 수집, 학습 기반 조작, 그리고 Physical AI까지 — 센서에서 정책까지, 로봇 손의 감각을 완성하는 종합 가이드

---

## Part I: 촉각의 기초 (Foundations of Touch)

### Chapter 1. 왜 촉각인가 — 로봇에게 손의 감각을 (Why Tactile Sensing)
- 1.1 생물학적 촉각의 원리
- 1.2 촉각 로봇 공학의 역사와 발전
- 1.3 촉각 없이 실패하는 사례: 파지 실패, 미끄러짐, 변형 물체
- 1.4 촉각이 가능하게 하는 것: 힘 조절, 미끄러짐 감지, 자세 추정, 질감 인식
- 1.5 산업 및 일상 응용 전망
- 1.6 이 책의 구성과 로드맵

### Chapter 2. 촉각 센서 기술 — 로봇의 피부 (Tactile Sensor Technology)
- 2.1 센서 물리: 압저항식, 정전용량식, 광학식, 자기식
- 2.2 비전 기반 촉각 센서: GelSight에서 Digit 360까지
- 2.3 다축 센싱: 법선력과 전단력의 중요성
- 2.4 센서 통합 설계: F-TAC Hand 사례
- 2.5 센서 유형별 비교와 선택 가이드
- 2.6 최신 동향: 신경형태학적 센서, 자가 치유 센서

### Chapter 3. 촉각 데이터: 표현과 수집 (Tactile Data: Representation & Collection)
- 3.1 데이터 표현의 분류 체계: 벡터, 행렬, 맵, 포인트 클라우드, 메시, 이미지
- 3.2 표현 선택이 태스크 성능에 미치는 영향
- 3.3 정규 표현과 센서 무관 표현
- 3.4 데이터 수집 파이프라인: 원격 조작, 시연 학습, 자율 탐색
- 3.5 공개 데이터셋: Touch-and-Go, Touch100k, ObjectFolder, VTDexManip
- 3.6 자기지도 사전학습: Sparsh, UniTouch

---

## Part II: 로봇 핸드와 인간 손 (Hands: Robot and Human)

### Chapter 4. 로봇 핸드 설계 — 잡기 위한 기계 (Robot Hand Design)
- 4.1 병렬 그리퍼 vs 다지 핸드: 설계 트레이드오프
- 4.2 오픈소스 혁명: LEAP Hand, ISyHand, ORCA
- 4.3 건 구동 방식: Pisa/IIT SoftHand, CRAFT, Mimic Robotics
- 4.4 핵심 설계 원리: 자유도, 구동, 유연성, 비용
- 4.5 센서 통합 설계: 핸드와 촉각의 결합
- 4.6 Allegro Hand 생태계와 연구 플랫폼

### Chapter 5. 지능형 메커니즘 — 물리적 지능 (Intelligent Mechanisms)
- 5.1 부족 구동: 적은 구동기로 형상 적응
- 5.2 가변 강성 구동기: 유연과 강성의 전환
- 5.3 능동 표면: 벨트/롤러 기반 연속 접촉 조작
- 5.4 세 메커니즘의 통합: 적응 → 고정 → 조작 시너지
- 5.5 공장 자동화 적용: 얇은 물체, 복수 물체, 재배치/정렬
- 5.6 연속 접촉 vs 불연속 접촉: 물리적 설계의 역할

### Chapter 6. 사람 손 데이터 수집 — 시연으로 가르치기 (Human Hand Data Collection)
- 6.1 인간 손 모델: MANO (778 정점, 16 관절)
- 6.2 모션 트래킹 글로브: 신축성 센서에서 상용 제품까지
- 6.3 촉각 글로브: STAG, OSMO와 오픈소스 접근
- 6.4 외골격 접근: DexUMI, ExoStart, DEXOP
- 6.5 인터넷 비디오 학습과 대규모 데이터
- 6.6 원격 조작: AnyTeleop, DexPilot, Bunny-VisionPro

---

## Part III: 학습과 전이 (Learning and Transfer)

### Chapter 7. 조작 학습 — 만지며 배우기 (Learning to Manipulate)
- 7.1 모방 학습: Diffusion Policy, ACT/ALOHA
- 7.2 강화학습: PPO + 촉각, Sim-to-Real RL
- 7.3 촉각 기반 조작: 촉각 전용 회전, 시각-촉각 융합, PP-Tac
- 7.4 힘 기반 학습: DexForce, ForceVLA
- 7.5 최적화 기반 대안: RGMC 챔피언의 궤적 최적화
- 7.6 방법론 비교: IL vs RL vs 최적화

### Chapter 8. VLA 모델 — 보고 듣고 행동하기 (Vision-Language-Action Models)
- 8.1 VLA 계보: RT-1에서 Gemini Robotics까지
- 8.2 pi0: VLM + Flow Matching
- 8.3 pi0.6/RECAP: 배치 후 강화학습으로 지속 개선
- 8.4 촉각 통합: ForceVLA, Tactile-VLA
- 8.5 스케일링과 데이터: Open X-Embodiment
- 8.6 VLA의 한계와 전망

### Chapter 9. Sim-to-Real 전이 — 가상에서 현실로 (Sim-to-Real Transfer)
- 9.1 시뮬레이션 엔진: Isaac Gym/Lab, MuJoCo, TACTO, DiffTactile
- 9.2 도메인 랜덤화: DeXtreme의 ADR
- 9.3 촉각 Sim-to-Real: 이진 촉각 피부 모델, 제로샷 전이
- 9.4 Real-Sim-Real: RoboPaint, X-Sim, ExoStart
- 9.5 Sim-to-Real 격차 분석: 동역학, 인지, 접촉 모델
- 9.6 합성 데이터의 위력과 한계

### Chapter 10. 사람에서 로봇으로 — Embodiment Retargeting
- 10.1 교차 체현 격차: 운동학적, 시각적, 촉각적 차이
- 10.2 운동학적 리타게팅: AnyTeleop, ImMimic, DexH2R
- 10.3 시각적 격차 해소: DexUMI, RoboPaint
- 10.4 촉각 격차 해소: UniTacHand, OSMO
- 10.5 기계적 결합: DEXOP의 4절 링크 방식
- 10.6 미해결 과제: 촉각 도메인 갭의 일반적 해법 부재

---

## Part IV: 통합과 전망 (Integration and Outlook)

### Chapter 11. 시스템 통합 — 연구적 관점 (Research Integration)
- 11.1 다중 모달 통합 아키텍처: 시각-촉각 융합, 힘-시각-언어 융합
- 11.2 End-to-End 시스템 사례: Mobile ALOHA, TacEx, PP-Tac, 통합 그리퍼
- 11.3 오픈소스 생태계와 연구 가속화
- 11.4 벤치마크와 표준화 동향: RGMC, 데이터 포맷, 교차 체현 평가

### Chapter 12. Physical AI와 로봇 핸드의 산업적 전망 (Industry Outlook)
- 12.1 Physical AI의 개념과 비전: NVIDIA, Foundation Models, 시뮬레이션
- 12.2 로봇 핸드 기업 동향: Figure AI, Tesla, Sanctuary AI, 1X, Unitree 외 11개사
- 12.3 제조업 배치 사례: BMW, Amazon, Hyundai, Mercedes, Magna
- 12.4 '손'이 Physical AI의 핵심인 이유
- 12.5 시장 전망과 투자 동향: $2.9B → $15.3B (CAGR 39.2%)
- 12.6 8가지 산업 트렌드

### Chapter 13. 한계와 미래 — Physical AI for Manufacturing을 향해 (Limitations & Future)
- 13.1 기존 연구의 공통 한계점 TOP 10: Sim-to-Real 격차에서 평가 표준화까지
- 13.2 미래 연구 방향: 센싱, 학습, 하드웨어, 데이터, 배치의 5개 그룹
- 13.3 제조업 특화 과제 10가지
- 13.4 우리의 연구 방향 제안: 메커니즘 + 촉각 + 학습의 삼각 통합

---

## 부록

- **용어집 (Glossary)** — 주요 기술 용어 한영 대조
- **통합 참고문헌 (References)** — 전체 BibTeX 목록
- **Figure 목록 (List of Figures)**
