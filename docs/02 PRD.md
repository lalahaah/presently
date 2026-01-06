# **🎁 Project Presently: Comprehensive Product Requirement Document (PRD) v2.0**

## **1\. Project Vision & Mission**

* **Vision**: 전 세계에서 가장 "사려 깊은(Thoughtful)" 선물을 가장 빠르게 제안하는 AI 에이전트.  
* **Mission**: 데이터와 AI를 결합하여 선물 선택의 고민을 제거하고, 주는 이와 받는 이 모두의 행복을 극대화함.

## **2\. Market Analysis (Target: Global/North America)**

* **Problem**:  
  * 미국 성인 1인당 연평균 선물 구매 횟수는 10회 이상이며, 70%가 무엇을 살지 결정하는 데 스트레스를 느낌.  
  * 검색 엔진 결과는 광고성 SEO 블로그 글이 점유하여 진정한 개인화 추천이 어려움.  
* **Solution**:  
  * Zero-Search Interface: 사용자가 검색하는 것이 아니라 AI가 제안함.  
  * Contextual Reasoning: 상품 자체보다 '왜(Why)'에 집중한 스토리텔링 제공.

## **3\. User Experience (UX) Specification**

### **3.1. Onboarding Flow**

* **Guest Access**: 가입 없이 첫 번째 추천 체험 가능 (Conversion 촉진).  
* **Social Auth**: Google, Apple ID 연동 (수령자 프로필 저장을 위해 필수).

### **3.2. The Profiling Engine (Input)**

* **Step 1: Relationship**: \[Spouse, Friend, Colleague, Parent, etc.\]  
* **Step 2: Personality Matrix**: 8\~12개의 큐레이션된 태그 (e.g., Techie, Minimalist, Outdoorsy, Artistic).  
* **Step 3: Occasion**: \[Birthday, Anniversary, Promotion, Apology, Just Because\].  
* **Step 4: Deep Context (AI Input)**: "He just started learning sourdough baking" 같은 자유 텍스트.  
* **Step 5: Budget Range**: Slider UI ($10 \- $500+).

### **3.3. AI Processing State (The "Magic" Moment)**

* **Lottie Animation**: AI가 고민하는 시각적 효과.  
* **Content Overlay**: "Searching 1,000+ items...", "Analyzing recipient's taste..." 등의 텍스트 노출.  
* **Monetization**: 이 구간에서 전면 광고(Interstitial) 송출.

### **3.4. Recommendation Results (Output)**

* **Format**: 가로 스와이프 가능한 카드 레이아웃.  
* **Content Per Card**:  
  * High-Res Image (via Amazon API or Placeholder).  
  * Product Title & Price.  
  * **The "Why": AI가 작성한 2\~3문장의 설득력 있는 추천 사유.**  
  * **"Message for Them": 선물과 함께 건네면 좋을 AI 생성 멘트.**  
  * 'Buy on Amazon' CTA Button (Affiliate link).

## **4\. Technical Specifications**

### **4.1. AI Prompt Engineering (Internal Logic)**

* **System Role**: "You are a professional gift concierge in NYC. You specialize in unique, high-quality gifts available on Amazon. Your tone is witty, elegant, and observant."  
* **Constraint**: "Always provide products that can be searched on Amazon. Avoid generic items like 'A book'."  
* **Output Schema**: JSON format containing item\_name, reasoning, search\_query, suggested\_message.

### **4.2. Database Schema (Supabase/PostgreSQL)**

* **Users**: uid, email, tier (free/premium).  
* **Recipients**: id, user\_id, name, birthday, tags\[\], preferences\_json.  
* **GiftLogs**: id, recipient\_id, item\_name, amazon\_url, user\_feedback (like/dislike).

### **4.3. Edge Case Handling**

* **No Results**: AI가 적절한 선물을 찾지 못할 경우 'Amazon Gift Card'와 함께 정중한 사과 문구 노출.  
* **Offensive Input**: 비윤리적/혐오적 입력 시 필터링 시스템 가동 및 가이드라인 제시.  
* **Price Mismatch**: 아마존 가격 변동 대응을 위해 'Price as of \[Date\]' 문구 표기.

## **5\. Monetization Strategy (Detail)**

### **5.1. Amazon Associates (Main Revenue)**

* 미국 시장 기준 카테고리별 1%\~10% 수수료.  
* 'High-Ticket Items' 우선 추천 로직 (예산이 충분할 경우).

### **5.2. AdMob Strategy**

* **Banner**: 메인 대시보드 하단 상시 노출.  
* **Interstitial**: 추천 결과 생성 직전 1회 (유저 피로도 고려하여 24시간 내 빈도 제한).

### **5.3. Premium Tier (Subscription)**

* **Price**: $2.99/month or $19.99/year.  
* **Benefits**: No Ads, Unlimited Recipients, Export Greeting Cards, Priority AI Model (GPT-4o).

## **6\. Privacy & Compliance (Global Standard)**

* **GDPR/CCPA**: 수령자 데이터 삭제 권리 보장.  
* **Terms of Service**: AI 추천 결과에 대한 면책 조항 (아마존 상품 가용성 등).

## **7\. Performance KPIs**

* **Retention**: 첫 추천 후 일주일 내 재방문율.  
* **CTR (Click-Through Rate)**: 아마존 구매 버튼 클릭률.  
* **CSAT**: 추천 결과에 대한 'Like' 비율 (80% 이상 목표).