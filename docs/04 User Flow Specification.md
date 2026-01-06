# **🗺️ Project Presently: Detailed User Flow Specification v1.0**

## **1\. Flow Overview**

본 유저 플로우는 사용자가 앱을 처음 설치한 순간부터 AI 추천을 받고, 구매로 이어지며, 지인 관리(CRM)를 위해 재방문하는 전체 사이클을 다룬다.

## **2\. Core User Journey Map**

### **Stage 1: Entry & Onboarding (진입 및 온보딩)**

1. **Splash Screen**: 브랜드 로고(Presently)와 슬로건 노출.  
2. **Welcome Carousel**: 서비스 핵심 가치(AI Curation, Amazon Integration, Thoughtful Giving)를 3개의 카드로 설명.  
3. **Entry Point (F1.1)**:  
   * **Guest Mode**: "Try it now" 버튼 클릭 시 로그인 없이 즉시 Profiler로 이동.  
   * **Sign-In**: Google/Apple 로그인을 통해 기존 데이터 동기화.

### **Stage 2: The Smart Profiler (선물 대상 분석)**

1. **Step 1\. Relationship (F2.1)**:  
   * "Who is the lucky person?" (예: Spouse, Boss, Friend, Child).  
2. **Step 2\. Personality & Traits (F2.1)**:  
   * Dynamic Chip Grid에서 태그 선택 (예: Techie, Minimalist, Bookworm).  
   * \[Optional\] 직접 키워드 입력 가능.  
3. **Step 3\. Occasion & Context (F2.2)**:  
   * 이벤트 선택 (예: Birthday, Housewarming, Just because).  
   * Free-text 입력: "Recently started yoga", "Moving to London next month".  
4. **Step 4\. Budget Setting (F2.3)**:  
   * Range Slider를 통해 예산 범위 설정 ($10 \- $500+).

### **Stage 3: AI Magic & Monetization (분석 및 수익화)**

1. **Action**: "Analyze & Find Gifts" 버튼 클릭.  
2. **The Wait (F3.2, F5.2)**:  
   * **Logic**: Supabase Edge Function 호출 및 OpenAI API 통신 시작.  
   * **UI**: "Curating the perfect ideas..." 애니메이션 노출.  
   * **Revenue**: **Interstitial Ad(전면 광고)** 송출 (프리미엄 유저 제외).  
3. **Ad Completion**: 광고 종료와 동시에 분석 완료된 결과 데이터 수신.

### **Stage 4: Recommendation Results (결과 확인 및 전환)**

1. **Result Gallery (F4.1)**:  
   * 가로 스와이프(Horizontal Swipe) 형태의 카드 레이아웃.  
   * 각 카드 구성: 상품 이미지, AI 추천 사유(Reasoning), 가격대 기호($$).  
2. **Conversion Action (F5.1)**:  
   * "View on Amazon" 클릭 \-\> Amazon Deep Link(Affiliate Tag 포함)를 통해 외부 브라우저 실행.  
3. **Thoughtful Extra**:  
   * "Copy Greeting Message" 클릭 \-\> AI가 생성한 축하 멘트 클립보드 복사.  
4. **Feedback**: 카드 하단 'Like / Dislike' 버튼으로 AI 학습 데이터 수집.

### **Stage 5: Retention & CRM (지인 관리 및 재방문)**

1. **Save Recipient (F6.1)**:  
   * 결과 확인 후 "Save \[Name\]'s Profile" 유도.  
   * 수령인의 생일/기념일 정보 입력 팝업 노출.  
2. **Dashboard (Main)**:  
   * 등록된 수령인 리스트(My Recipients) 노출.  
   * 가장 가까운 기념일 D-Day 카운트다운 표시.  
3. **Push Notification (F6.2)**:  
   * 기념일 7일 전: "Don't forget \[Name\]'s birthday\! Want a new recommendation?" 알림.  
   * 알림 클릭 시 기존 프로필이 자동 로드된 Profiler로 연결.

## **3\. Exception & Edge Case Flows (예외 처리)**

### **E1. API Timeout / Error**

* **Flow**: 호출 10초 경과 시 \-\> "Our AI Shopper is a bit overwhelmed" 에러 메시지 \-\> "Retry" 버튼 제공.

### **E2. Budget Mismatch**

* **Flow**: 설정 예산 내 적절한 상품이 없을 경우 \-\> "We found something slightly over your budget but perfect"라는 메시지와 함께 예산 \+20% 상품 노출.

### **E3. Guest to Member Conversion**

* **Flow**: 게스트 모드에서 추천 결과 확인 후 "Save" 클릭 시 \-\> 로그인 유도 팝업 \-\> 로그인 성공 시 현재 추천 데이터를 계정에 자동 귀속.

## **4\. Feature Flow Visualization (Summary)**

\[Splash\] \-\> \[Welcome\] \-\> \[Profiler (4 Steps)\] \-\> \[Interstitial Ad\] \-\> \[AI Result Cards\] \-\> \[Amazon Link / Save Profile\] \-\> \[Dashboard/Reminder\]