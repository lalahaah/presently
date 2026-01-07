/// 선물 프로필 데이터 모델
/// 사용자가 입력한 선물 대상자의 정보를 담는 모델
class GiftProfile {
  /// 관계 (예: 배우자, 친구, 부모님 등)
  final String relationship;

  /// MBTI 타입 (선택적)
  final String? mbtiType;

  /// 성격 특성 리스트 (최대 5개)
  final List<String> personalityTraits;

  /// 이벤트 종류 (예: 생일, 기념일 등)
  final String occasion;

  /// 자유 텍스트 컨텍스트
  final String? contextNote;

  /// 최소 예산 (원 단위)
  final int budgetMin;

  /// 최대 예산 (원 단위)
  final int budgetMax;

  const GiftProfile({
    required this.relationship,
    this.mbtiType,
    required this.personalityTraits,
    required this.occasion,
    this.contextNote,
    required this.budgetMin,
    required this.budgetMax,
  });

  /// JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      'relationship': relationship,
      'mbtiType': mbtiType,
      'personalityTraits': personalityTraits,
      'occasion': occasion,
      'contextNote': contextNote,
      'budgetMin': budgetMin,
      'budgetMax': budgetMax,
    };
  }

  /// JSON으로부터 생성
  factory GiftProfile.fromJson(Map<String, dynamic> json) {
    return GiftProfile(
      relationship: json['relationship'] as String,
      mbtiType: json['mbtiType'] as String?,
      personalityTraits: List<String>.from(json['personalityTraits'] as List),
      occasion: json['occasion'] as String,
      contextNote: json['contextNote'] as String?,
      budgetMin: json['budgetMin'] as int,
      budgetMax: json['budgetMax'] as int,
    );
  }

  /// 복사본 생성
  GiftProfile copyWith({
    String? relationship,
    String? mbtiType,
    List<String>? personalityTraits,
    String? occasion,
    String? contextNote,
    int? budgetMin,
    int? budgetMax,
  }) {
    return GiftProfile(
      relationship: relationship ?? this.relationship,
      mbtiType: mbtiType ?? this.mbtiType,
      personalityTraits: personalityTraits ?? this.personalityTraits,
      occasion: occasion ?? this.occasion,
      contextNote: contextNote ?? this.contextNote,
      budgetMin: budgetMin ?? this.budgetMin,
      budgetMax: budgetMax ?? this.budgetMax,
    );
  }
}
