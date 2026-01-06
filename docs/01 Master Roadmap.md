# **🎁 Project Presently: Master Roadmap**

## **Phase 1: Planning & Strategy (기획 및 전략)**

* \[ \] **Branding & Voice Definition**: 'Presently'만의 AI 페르소나 설정 (예: Wittty, Warm, Professional)  
* \[ \] **User Flow Mapping**:  
  * Landing \-\> Onboarding \-\> Profile Input \-\> AI Analyzing \-\> Recommendation Result \-\> Amazon Link  
* \[ \] **Functional Specification**: MVP에 포함될 필수 기능 확정 (성격 키워드 선택, 예산 설정, 결과 카드 UI)  
* \[ \] **Market Research**: 미국 아마존 어필리에이트 인기 선물 카테고리 조사

## **Phase 2: Design & UX (디자인)**

* \[ \] **Wireframing**: Flutter 위젯 구조 설계를 위한 와이어프레임 작성  
* \[ \] **Design System**: 'Modern Minimalist' 컨셉의 컬러 팔레트 및 폰트 확정  
* \[ \] **Component Design**:  
  * Recommendation Cards (이미지, 이유, 구매 버튼)  
  * Personality Selection Chips  
  * Loading Animation (AI가 고민하는 듯한 느낌)

## **Phase 3: Infrastructure Setup (인프라 구축)**

* \[ \] **Supabase Project Configuration**: DB 스키마 생성 및 Auth 설정  
* \[ \] **Edge Functions Integration**: OpenAI API 호출 로직 구현 (보안 및 비용 관리)  
* \[ \] **Amazon Affiliate API/Scraping Setup**: 상품 정보 및 링크 생성 로직 검증  
* \[ \] **AdMob Account Setup**: 광고 단위 생성 및 SDK 연동 준비

## **Phase 4: Core Development (핵심 개발)**

* \[ \] **Recipient Profiler**: 성격/취향 입력 위젯 개발  
* \[ \] **AI Engine Link**: OpenAI GPT-4o-mini 프롬프트 엔지니어링 및 JSON 파싱 로직  
* \[ \] **Result View**: AI 추천 사유 스토리텔링 레이아웃 구현  
* \[ \] **History & Retention**: 과거 추천 결과 저장 및 다시보기 기능

## **Phase 5: Monetization & Analytics (수익화 및 분석)**

* \[ \] **AdMob Integration**: 전면 광고 및 배너 광고 배치  
* \[ \] **Tracking**: GA4(Firebase Analytics) 또는 Mixpanel 연동 (어떤 상품을 가장 많이 클릭하는가?)  
* \[ \] **IAP (Optional)**: 광고 제거 및 무제한 추천 구독 기능

## **Phase 6: Launch & Marketing (출시 및 홍보)**

* \[ \] **App Store/Play Store Optimization (ASO)**: 영어권 키워드 최적화 (Gift ideas, Personal shopper 등)  
* \[ \] **Landing Page**: 서비스 소개 및 앱 다운로드 유도 웹사이트 (Next.js)  
* \[ \] **Global Soft Launch**: 특정 지역(예: 캐나다, 호주) 우선 출시 후 피드백 반영