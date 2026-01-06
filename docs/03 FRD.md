# **📝 Project Presently: Functional Requirements Document (FRD) v2.0**

## **1\. Document Overview**

본 문서는 AI 기반 선물 추천 플랫폼 'Presently'의 정식 출시를 위한 최종 기능 명세서이다. v1.0 대비 AI 연동 규격, 데이터 스키마, 수익화 로직의 세부 구현 방식을 구체화하였다.

## **2\. System Architecture & Data Flow**

1. **Client**: Flutter 기반 크로스 플랫폼 앱.  
2. **Auth**: Supabase Auth (Social & Anonymous).  
3. **Backend**: Supabase Edge Functions (Deno runtime).  
4. **AI Layer**: OpenAI GPT-4o-mini (JSON Mode).  
5. **External**: Amazon Associates API (Deep Link), Google AdMob SDK.

## **3\. Detailed Functional Requirements**

### **3.1. Authentication & Session Management (F1)**

* **F1.1. Seamless Onboarding**:  
  * 가입 전 1회 체험 기회 제공.  
  * 체험 데이터(추천 결과)는 익명 ID와 연동하여 보존하며, 로그인 시 해당 계정으로 데이터 마이그레이션(Merge) 수행.  
* **F1.2. Account Link**: Google 및 Apple ID를 통한 Single Sign-On(SSO) 지원.  
* **F1.3. User State**: is\_premium 플래그를 통해 광고 제거 및 프리미엄 기능 활성화 여부 판단.

### **3.2. Advanced Smart Profiler (F2)**

* **F2.1. Dynamic Personality Grid**:  
  * 서버에서 제공하는 카테고리별 성격 칩(Chip) 렌더링.  
  * 사용자가 직접 키워드 추가 입력 가능 (최대 3개).  
* **F2.2. Event Contextualizer**:  
  * 이벤트 목적(생일, 집들이, 퇴사 등)에 따라 AI의 추천 가중치 조정.  
* **F2.3. Budget Guardrail**:  
  * 슬라이더 상한액 설정 시 AI는 해당 금액의 \+10% 내외 상품까지만 추천하도록 제한.

### **3.3. AI Intelligence & Tool Calling (F3)**

* **F3.1. Request Schema**:  
  {  
    "recipient\_profile": {  
      "relationship": "Wife",  
      "traits": \["Adventurous", "Techie"\],  
      "context": "Moving to a new house",  
      "budget": 100  
    }  
  }

* **F3.2. Response Schema (Strict JSON Mode)**:  
  {  
    "recommendations": \[  
      {  
        "item\_name": "Smart Garden Kit",  
        "reasoning": "Since she likes tech and is moving to a new home...",  
        "emotional\_pitch": "Bring high-tech nature into your new living room.",  
        "search\_keyword": "Smart indoor herb garden",  
        "suggested\_greeting": "Happy new home\! Let's grow memories together."  
      }  
    \]  
  }

* **F3.3. Prompt Engineering Constraints**:  
  * 모든 답변은 반드시 1인칭 관찰자 시점의 전문 쇼퍼 톤으로 작성.  
  * 상품은 아마존(Amazon.com)에서 실제 검색 가능한 범주로 한정.

### **3.4. Curation Interface & Monetization (F4, F5)**

* **F4.1. Interactive Result Card**:  
  * 상품 이미지(Placeholder \-\> Amazon Fetch), 상품명, 가격대, 추천 사유 표시.  
  * 'Copy Greeting' 버튼을 통해 AI 생성 문구를 클립보드에 복사.  
* **F5.1. Affiliate Deep Link Generation**:  
  * https://www.amazon.com/s?k={search\_keyword}\&tag={affiliate\_id} 형태의 딥링크 생성.  
* **F5.2. Strategic Ad Placement**:  
  * **Banner Ad**: 메인 화면 하단 고정.  
  * **Interstitial Ad**: 프로파일 입력 완료 후 'Analyze' 버튼 클릭 시 즉시 송출. 광고 종료 후 결과 화면 노출.  
  * **Rewarded Ad**: 5회 이상 추천 요청 시, 광고 시청 후 추가 추천권 부여.

### **3.5. Gift CRM & Notification (F6)**

* **F6.1. Recipient Database**: 수령인별 생일, 기념일, 과거 선물 이력 저장.  
* **F6.2. Smart Reminder**: 기념일 7일 전 및 당일 오전 9시(유저 타임존 기준) 푸시 알림 발송.

## **4\. Technical Constraints & Security**

* **4.1. API Security**: Supabase Edge Functions 호출 시 유효한 JWT 토큰 및 API Key 검증 필수.  
* **4.2. Data Encryption**: 사용자의 텍스트 입력값 중 민감 정보 비식별화 처리.  
* **4.3. Caching Logic**: 동일 프로필 조합(Relationship \+ Tags \+ Budget)에 대해 48시간 동안 동일 결과 반환 (DB Cache Hit).

## **5\. Performance & Quality (Non-functional)**

* **Latency**: AI 응답 대기 시간 10초 이내 (최적화 목표 5초).  
* **Stability**: API 에러 시 유저에게 "Our AI shopper is busy" 등 재치 있는 에러 메시지 노출.  
* **Compatibility**: iOS 15+, Android 10+ 대응.