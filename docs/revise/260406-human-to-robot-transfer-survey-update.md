# 260406 — Human-to-Robot Transfer 최신 문헌 기반 Ch6/10/13 대폭 보강

> **맥락**: 2026-04-06 세션에서 기존 책(13챕터)을 전체 정독한 뒤, "데이터글러브로 촉각 데이터를 모으면 쓸모가 있는가? 어떻게 써야 하는가? 한계는?" 관점으로 2024-2026 최신 논문 40+편을 서베이했다. 그 결과, **Chapter 10 (Embodiment Retargeting)이 가장 큰 보강이 필요**하며, Chapter 6(데이터 수집), 13(한계/미래)도 상당한 업데이트가 필요하다는 결론에 도달했다.
>
> **핵심 발견**: (1) 인간 데이터만으로 로봇 제어가 가능해짐 (X-Sim, EgoZero, VidBot), (2) human+robot co-training이 각 단독보다 우월 (EgoMimic +34-228%, EgoScale +54%), (3) log-linear 스케일링 법칙 존재 (EgoScale R²=0.998), (4) 촉각 추가가 유의미한 성능 향상 (OSMO +16%p, VTDexManip +20%)
>
> **주의**: 새로운 연구 방향 제안(TacScale, TacPlay 등)은 비공개 공동연구 내용이므로 이 문서에 포함하지 않는다. 공개된 문헌 기반 서베이만.

---

## 1. 세션에서 수행한 작업 요약

### 1.1 책 전체 깊이 읽기

GitHub 레포 `terryum/book-robot-hand-tactile-sensor`의 13챕터를 모두 읽고, 특히 아래 관점에 집중하여 분석했다:
- "사람 손과 로봇 손에 어떤 촉각센서 데이터를 얻어야 로봇이 사람의 복잡한 손 동작을 잘 학습할 수 있는가"
- "데이터글러브로 촉각 데이터를 사람 손동작으로부터 모으면 쓸모가 있는가? 어떻게? 한계는?"

### 1.2 2024-2026 최신 논문 대규모 서베이

책에 포함되지 않았거나 발행 이후 나온 논문들을 대규모로 조사했다. 총 7개 카테고리, 40+ 논문.

---

## 2. 책에 추가/보강해야 할 논문 목록 (카테고리별)

### 2.1 Chapter 6 (사람 손 데이터 수집) 보강

현재 책에 있는 것: STAG, OSMO, DexUMI, ExoStart, DEXOP, AnyTeleop, DexPilot 등.

**추가해야 할 논문들:**

| 논문 | venue | 핵심 내용 | 책에서 넣을 위치 |
|------|-------|-----------|-----------------|
| **AirExo / AirExo-2** (SJTU) | ICRA 2024 / CoRL 2025 | ~$300 패시브 외골격, in-the-wild 인간 시연 수집, 3min teleop + in-wild data ≥ 20min teleop only | §6.4 외골격 접근 |
| **ACE** (UCSD) | CoRL 2024 | Hand-facing camera + 외골격, 단일 시스템으로 humanoid/arm/gripper/quadruped 모두 텔레옵 | §6.6 원격 조작 |
| **NuExo** (Nubot Lab) | ICRA 2025 | 5.2kg 백팩형 능동 외골격, 100% 상지 ROM, 2.5mm 나사 조이기 성공 | §6.4 외골격 접근 |
| **HumanoidExo** (NUDT) | arXiv Oct 2025 | 경량 외골격 + LiDAR, 전신 궤적, exo 데이터만으로 보행 학습 | §6.4 외골격 접근 |
| **DOGlove** (TEA Lab) | RSS 2025 | $600 이하, 21-DoF 모션캡처 + 5-DoF 힘 피드백 + 5-DoF 햅틱 | §6.6 원격 조작 |
| **TacCap** | arXiv Mar 2025 | FBG 광학 촉각 센서 thimble, 인간/로봇 양쪽 장착 가능, EMI 면역 | §6.3 촉각 글로브 |
| **VTDexManip** | ICLR 2025 | 565K 프레임, 10태스크, 182물체, 최초 visual-tactile 인간 시연 데이터셋 | §6.3 촉각 글로브 / §3.5 데이터셋 |
| **EgoDex** (Apple) | 2025 | Apple Vision Pro + ARKit, 829시간, 90M 프레임, 194태스크, 30Hz per-finger tracking | §6.5 대규모 데이터 |

### 2.2 Chapter 7 (조작 학습) 보강

**추가해야 할 논문들:**

| 논문 | venue | 핵심 내용 | 위치 |
|------|-------|-----------|------|
| **Ye et al.** | Science Robotics 2025/26 | 인간 시연에서 visual-tactile self-supervised pretraining → binary 촉각 + RL → 85% 성공 | §7.3 촉각 기반 조작 |
| **LAPA** | ICLR 2025 | 인간 비디오에서 VQ-VAE로 latent action pretraining, 30x 효율 향상 | §7.1 모방 학습 |

### 2.3 Chapter 8 (VLA 모델) 보강

**추가해야 할 논문들:**

| 논문 | venue | 핵심 내용 | 위치 |
|------|-------|-----------|------|
| **pi0 human-to-robot transfer** | PI Dec 2025 | human co-finetuning으로 4개 일반화 시나리오에서 2x 개선, emergent alignment | §8.2-8.3 |
| **EgoVLA** | arXiv Jul 2025 | egocentric 인간 비디오 pretrain → 로봇 fine-tune, MANO hand param 사용 | §8.4 / 새 절 |
| **PhysBrain** | arXiv Dec 2025 | 3M VQA from Ego4D/BuildAI → VLM fine-tune → 53.9% SimplerEnv 성공 | §8.5 스케일링 |

### 2.4 Chapter 9 (Sim-to-Real) 보강

**추가해야 할 논문들:**

| 논문 | venue | 핵심 내용 | 위치 |
|------|-------|-----------|------|
| **DexWM** (Meta FAIR) | arXiv Dec 2025 | 829hr 인간 비디오 + 로봇 데이터 → world model, 83% real grasping zero-shot | §9.4 Real-Sim-Real |

### 2.5 Chapter 10 (Embodiment Retargeting) — 대폭 보강 필요

현재 책의 가장 큰 약점. 최신 논문이 폭발적으로 증가한 분야.

**추가해야 할 논문들:**

| 논문 | venue | 핵심 내용 | 위치 |
|------|-------|-----------|------|
| **EgoMimic** (Georgia Tech) | arXiv 2024 | human ego + robot co-train, 1hr hand > 2hr robot data, +34-228% | §10.2 or 새 절 |
| **EgoScale** (NVIDIA) | arXiv Feb 2026 | 20,854hr human data, log-linear scaling law R²=0.998, +54% | §10.2 or 새 절 |
| **X-Sim** (Cornell) | CoRL 2025 Oral | 인간 RGBD 1개 → sim RL → real, zero robot data | §10.2 |
| **Human2Sim2Robot** (Stanford) | CoRL 2025 | 인간 RGB-D 1개 → RL init + reward → +55% over baselines | §10.2 |
| **VidBot** (TU Munich) | CVPR 2025 | 인터넷 비디오 → 3D affordance → zero-shot, +20% | §10.2 |
| **Human2Bot** | Autonomous Robots 2025 | 인간 비디오 → task similarity reward → zero-shot, no robot data | §10.2 |
| **RoboWheel** | arXiv Dec 2024 | HOI reconstruction + retargeting + sim augmentation, teleop과 동급 | §10.2 |
| **DexH2R** | arXiv Nov 2024 | task-oriented residual RL, 70.9% grasping, +40% over retargeting | §10.2 |
| **ManipTrans** | CVPR 2025 | bimanual retargeting, 3.3K episodes DexManipNet | §10.2 |
| **Park et al.** (CMU/SNU) | arXiv Jan 2025 | joint motion manifold, 0.59 vs 0.39 baseline | §10.2 |
| **Mirage** | RSS 2024 | cross-painting for zero-shot visual transfer | §10.3 |
| **AoE** | arXiv Feb 2026 | 50 teleop + 200 human ego, Close Laptop 45%→95% | 새 절 (co-training) |
| **EgoZero** | 2025 | 스마트글래스만으로 7태스크 70% 성공, zero robot data | §10.2 |
| **H2R** | arXiv 2025 | human-to-robot video augmentation for pretraining | §10.3 |
| **Masquerade** | 2025 | human video를 robot visual로 변환 | §10.3 |

### 2.6 Chapter 11 (시스템 통합) 보강

| 논문 | 핵심 내용 | 위치 |
|------|-----------|------|
| **Ego4D** (Meta) | 3,670hr egocentric, 931 participants, 9 countries | §11.3 오픈소스 |
| **BuildAI** | 공장 egocentric 비디오 데이터셋 | §11.3 오픈소스 |

### 2.7 Chapter 13 (한계와 미래) 보강

현재 책의 Top 10 한계점 + 5개 미래 연구 그룹은 잘 정리되어 있으나, 위 논문들의 결과를 반영하여 업데이트 필요:

- **한계 #4 (데이터 부족)**: EgoScale의 log-linear 스케일링 법칙 추가 → "양을 늘리면 예측 가능하게 성능 향상"
- **한계 #6 (Cross-embodiment transfer)**: UniTacHand만 언급 → EgoMimic, X-Sim, VidBot 등 2024-2026 진전 추가
- **미래 방향 "Data"**: egocentric 수집의 폭발적 성장 (EgoDex 829hr, Ego4D 3,670hr) 추가

---

## 3. 책의 구조적 보강 제안

### 3.1 Chapter 10 분량 대폭 확대 필요

현재 Ch10은 AnyTeleop, ImMimic, DexH2R 정도만 다루는데, 2024-2026에 이 분야에서 가장 많은 논문이 나왔다. 아래 구조로 확장 제안:

```
§10.1 교차 체현 격차의 세 차원 (기존)
§10.2 운동학적 리타게팅 (기존 + X-Sim, Human2Sim2Robot, VidBot, DexH2R 추가)
§10.3 시각적 격차 해소 (기존 + Mirage, H2R, Masquerade 추가)
§10.4 촉각 격차 해소 (기존)
§10.5 기계적 결합 (기존)
§10.6 Human + Robot Co-training (신규 절)
  - EgoMimic: co-training 프레임워크, 1hr hand > 2hr robot
  - EgoScale: log-linear scaling law, 20K+ hr
  - AoE: 50 teleop + 200 human ego > 50 teleop only
  - pi0: emergent alignment at scale
§10.7 Teleop-Free 접근 (신규 절)
  - X-Sim: zero robot data via sim RL
  - EgoZero: smart glasses only
  - VidBot: internet video zero-shot
  - Human2Sim2Robot: single demo
§10.8 미해결 과제 (기존 §10.6 확장)
```

### 3.2 새로운 Figure/Table 제안

- **Table 10.X**: "Human Data → Robot Policy: 방법론 비교" (위 서베이의 요약 테이블)
  - 열: 논문, 인간 데이터만으로 가능?, 혼합 시 개선?, 핵심 비율, 검증 태스크 수
- **Figure 10.X**: "2024-2026 Human-to-Robot Transfer 연구 흐름도"
  - 2024 (보조 신호) → 2024-25 (직접 학습 데이터) → 2025-26 (human-only/혼합 동시 확인)

### 3.3 반직관적 발견 강조

책에서 강조해야 할 최근 발견들:
1. **넓은 커버리지의 단순 센서 > 좁은 영역의 고해상도 센서** (Yin et al. binary tactile 93%)
2. **1시간 human data > 2시간 robot data** (EgoMimic)
3. **인간 데이터만으로 로봇 제어 가능** (X-Sim, EgoZero, VidBot) — 2024년까지는 불가능하다고 여겨졌음
4. **Log-linear 스케일링**: 인간 데이터 양 ↑ → 성능 예측 가능하게 ↑ (EgoScale R²=0.998)

---

## 4. 챕터별 구체적 수정 지침

### Chapter 3 수정
- §3.5에 VTDexManip 데이터셋 추가 (565K frames, visual-tactile, ICLR 2025)
- §3.5에 EgoDex 추가 (829hr, Apple Vision Pro)

### Chapter 6 수정
- §6.3에 TacCap, VTDexManip glove 추가
- §6.4에 AirExo/AirExo-2, NuExo, HumanoidExo, ACE 추가
- §6.5에 EgoDex, Ego4D 활용 사례 추가
- §6.6에 DOGlove 추가

### Chapter 7 수정
- §7.3에 Ye et al. (Science Robotics) 추가 — visual-tactile self-supervised pretrain + RL
- §7.1에 LAPA 추가 — human video latent action pretraining

### Chapter 8 수정
- §8.2-8.3에 pi0 human co-finetuning 결과 추가
- EgoVLA, PhysBrain 추가

### Chapter 9 수정
- §9.4에 DexWM 추가 — world model from 829hr human video

### Chapter 10 수정
- 위 §3.1의 확장된 구조로 대폭 재작성
- 핵심: "co-training"과 "teleop-free" 두 흐름을 별도 절로 분리

### Chapter 13 수정
- Top 10 한계 업데이트 (위 §2.7 참조)
- 미래 방향에 egocentric 수집 트렌드 반영

---

## 5. 작업 우선순위

1. **Chapter 10 재작성** — 가장 시급, 가장 많은 논문 추가 필요
2. **Chapter 6 보강** — 외골격/글로브 논문 추가
3. **Chapter 13 업데이트** — 한계점/미래 방향 반영
4. **Chapter 3, 7, 8, 9** — 개별 논문 추가 (상대적으로 소규모)

---

## 6. 프로젝트 구조 참고

- 책 원고: `book/ko/ch01.md` ~ `ch13.md` + `toc.md` + `glossary.md`
- 영문: `book/en/` (동일 구조)
- 워크스페이스: `_workspace/` (리서치 노트, 참조 체크 보고서 등)
- 스킬: `.claude/skills/book-write/`, `.claude/skills/literature-research/`
- PDF 빌드: `scripts/` + `build_site.py`
- i18n: ko/en 양쪽 반영 필수

---

## 7. 주의사항

- **새로운 연구 방향 제안 내용은 절대 포함하지 않음** — 비공개 공동연구 방향은 이 문서에 없다
- 공개된 문헌 기반 서베이 내용만 추가
- 기존 책의 톤/스타일/구조를 유지하면서 보강
- 참고문헌은 기존 BibTeX 형식에 맞춰 추가
