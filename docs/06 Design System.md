# **🎨 Presently Design System v1.0**

## **1\. Design Philosophy (디자인 철학)**

* **Intelligent Simplicity**: 복잡한 AI 로직은 뒤로 숨기고, 사용자에게는 가장 단순한 선택지만 제공한다.  
* **Emotional Premium**: 선물이라는 행위의 가치에 걸맞게, 정제되고 고급스러운 시각 언어를 사용한다.  
* **Contextual Clarity**: 현재 사용자가 어느 단계에 있는지, AI가 무엇을 하고 있는지 명확하게 전달한다.

## **2\. Visual Foundation (시각적 기초)**

### **2.1. Color Palette (컬러 팔레트)**

영미권 프리미엄 서비스를 타겟으로 한 'Modern Luxury' 테마입니다.

* **Primary (Golden Oak)**: \#D4AF37 \- 브랜드의 핵심 컬러. 선물, 프리미엄, 가치를 상징.  
* **Secondary (Charcoal Black)**: \#1A1A1A \- 텍스트 및 주요 배경. 세련됨과 깊이감 제공.  
* **Surface (Soft Bone)**: \#F9F8F6 \- 편안한 읽기 경험을 위한 배경색.  
* **Accent (Soft Emerald)**: \#2D5A27 \- '추천 성공', '구매 완료' 등 긍정적 인터랙션용.  
* **Error (Deep Rose)**: \#BC4749 \- 오류 및 경고.

### **2.2. Typography (타이포그래피)**

글로벌 가독성을 위해 구글 폰트(Google Fonts) 기반으로 구성합니다.

* **Headings (Serif)**: Playfair Display \- 큐레이션된 매거진 느낌을 주기 위해 제목에 사용.  
* **Body & UI (Sans-serif)**: Inter \- 가독성이 뛰어나며 현대적인 인터페이스에 최적화.  
  * *Display*: 32pt / Bold (홈 화면 인사말)  
  * *Heading 1*: 24pt / Semi-bold (섹션 타이틀)  
  * *Body*: 16pt / Regular (추천 사유, 설명글)  
  * *Caption*: 12pt / Medium (부가 정보, 태그)

## **3\. UI Components (핵심 컴포넌트)**

### **3.1. Choice Chips (선택용 칩)**

* **Default**: White background, 1px Border (\#E0E0E0), Round 20px.  
* **Selected**: Primary (\#D4AF37) background, White text, Elevation shadow.  
* **Interaction**: 클릭 시 미세한 햅틱 반응 및 크기 변화(Scale down 0.95).

### **3.2. Recommendation Cards (추천 카드)**

* **Structure**:  
  * **Image**: 1:1 Ratio, 커브드 코너(16px).  
  * **Badge**: AI 추천 점수 또는 'Best Match' 라벨 상단 배치.  
  * **Content**: 상품명(Bold) \+ 가격 지표($$$) \+ AI 코멘트(Italic).  
  * **Action**: 'View on Amazon' 골드 버튼 (Full width).

### **3.3. Progress Indicator (분석 단계 표시)**

* **Style**: 상단 슬림한 라인 형태.  
* **Motion**: 부드러운 필링(Filling) 효과. AI 분석 단계에서는 '펄스(Pulse)' 애니메이션 추가.

## **4\. Micro-interactions (마이크로 인터랙션)**

* **The Magic Loading**: "AI가 아마존을 뒤지는 중"일 때, 반짝이는 입자(Particle) 효과가 중앙 아이콘 주위를 감싸며 기대감을 조성.  
* **Card Swipe**: 추천 결과 확인 시 카드를 옆으로 넘길 때 물리적인 탄성(Elasticity) 효과 적용.  
* **Success Feedback**: 아마존 링크 클릭 시, Presently 로고가 살짝 웃는 듯한 모션을 보여주며 "Good Luck with your gift\!" 문구 노출.

## **5\. Accessibility & Dark Mode (접근성)**

* **Contrast**: 텍스트와 배경의 대비비를 최소 4.5:1로 유지.  
* **Dark Mode**: Charcoal Black(\#1A1A1A)을 메인 배경으로 하고, 골드 컬러의 채도를 살짝 낮추어 눈의 피로도를 줄임.