/// 선물 관련 상수 정의
/// MBTI 타입, 관계, 성격 특성, 이벤트 종류 등의 정적 데이터
class GiftConstants {
  GiftConstants._();

  // ========== MBTI 타입 ==========

  /// MBTI 타입 코드 리스트 (16개 + "모름")
  static const List<String> mbtiTypes = [
    'none', // 모름
    'ISTJ',
    'ISFJ',
    'INFJ',
    'INTJ',
    'ISTP',
    'ISFP',
    'INFP',
    'INTP',
    'ESTP',
    'ESFP',
    'ENFP',
    'ENTP',
    'ESTJ',
    'ESFJ',
    'ENFJ',
    'ENTJ',
  ];

  /// MBTI 타입 한국어 라벨 (설명 포함)
  static const Map<String, String> mbtiLabelsKo = {
    'none': '모름 / 선택 안 함',
    'ISTJ': 'ISTJ - 청렴결백한 논리주의자',
    'ISFJ': 'ISFJ - 용감한 수호자',
    'INFJ': 'INFJ - 선의의 옹호자',
    'INTJ': 'INTJ - 용의주도한 전략가',
    'ISTP': 'ISTP - 만능 재주꾼',
    'ISFP': 'ISFP - 호기심 많은 예술가',
    'INFP': 'INFP - 열정적인 중재자',
    'INTP': 'INTP - 논리적인 사색가',
    'ESTP': 'ESTP - 모험을 즐기는 사업가',
    'ESFP': 'ESFP - 자유로운 영혼의 연예인',
    'ENFP': 'ENFP - 재기발랄한 활동가',
    'ENTP': 'ENTP - 뜨거운 논쟁을 즐기는 변론가',
    'ESTJ': 'ESTJ - 엄격한 관리자',
    'ESFJ': 'ESFJ - 사교적인 외교관',
    'ENFJ': 'ENFJ - 정의로운 사회운동가',
    'ENTJ': 'ENTJ - 대담한 통솔자',
  };

  /// MBTI 타입 영어 라벨
  static const Map<String, String> mbtiLabelsEn = {
    'none': 'Unknown / Not Selected',
    'ISTJ': 'ISTJ - The Logistician',
    'ISFJ': 'ISFJ - The Defender',
    'INFJ': 'INFJ - The Advocate',
    'INTJ': 'INTJ - The Architect',
    'ISTP': 'ISTP - The Virtuoso',
    'ISFP': 'ISFP - The Adventurer',
    'INFP': 'INFP - The Mediator',
    'INTP': 'INTP - The Logician',
    'ESTP': 'ESTP - The Entrepreneur',
    'ESFP': 'ESFP - The Entertainer',
    'ENFP': 'ENFP - The Campaigner',
    'ENTP': 'ENTP - The Debater',
    'ESTJ': 'ESTJ - The Executive',
    'ESFJ': 'ESFJ - The Consul',
    'ENFJ': 'ENFJ - The Protagonist',
    'ENTJ': 'ENTJ - The Commander',
  };

  // ========== 관계 타입 ==========

  static const List<String> relationships = [
    'spouse',
    'partner',
    'friend',
    'parent',
    'sibling',
    'child',
    'colleague',
    'boss',
    'teacher',
    'other',
  ];

  // ========== 성격 특성 ==========

  static const List<String> personalityTraits = [
    'techie',
    'minimalist',
    'outdoorsy',
    'artistic',
    'foodie',
    'bookworm',
    'fitness',
    'fashionable',
    'homebody',
    'adventurous',
    'eco_friendly',
    'practical',
  ];

  // ========== 이벤트 종류 ==========

  static const List<String> occasions = [
    'birthday',
    'anniversary',
    'wedding',
    'graduation',
    'promotion',
    'housewarming',
    'apology',
    'thank_you',
    'just_because',
    'other',
  ];

  // ========== 예산 범위 ==========

  /// 최소 예산 (원)
  static const int minBudget = 10000;

  /// 최대 예산 (원)
  static const int maxBudget = 500000;

  /// 예산 단계 (슬라이더 증가 단위)
  static const int budgetStep = 10000;
}
