/// 선물 추천 결과 데이터 모델
/// AI가 생성한 선물 추천 정보를 담는 모델
class GiftRecommendation {
  /// 상품명
  final String itemName;

  /// AI 추천 사유 (2~3문장)
  final String reasoning;

  /// 감정적 호소 문구
  final String emotionalPitch;

  /// 쿠팡 검색 키워드
  final String searchKeyword;

  /// 선물 메시지 제안
  final String suggestedGreeting;

  /// 예상 가격 (원 단위)
  final int? estimatedPrice;

  /// 상품 이미지 URL (선택적)
  final String? imageUrl;

  const GiftRecommendation({
    required this.itemName,
    required this.reasoning,
    required this.emotionalPitch,
    required this.searchKeyword,
    required this.suggestedGreeting,
    this.estimatedPrice,
    this.imageUrl,
  });

  /// JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      'itemName': itemName,
      'reasoning': reasoning,
      'emotionalPitch': emotionalPitch,
      'searchKeyword': searchKeyword,
      'suggestedGreeting': suggestedGreeting,
      'estimatedPrice': estimatedPrice,
      'imageUrl': imageUrl,
    };
  }

  /// JSON으로부터 생성
  factory GiftRecommendation.fromJson(Map<String, dynamic> json) {
    return GiftRecommendation(
      itemName: json['itemName'] as String,
      reasoning: json['reasoning'] as String,
      emotionalPitch: json['emotionalPitch'] as String,
      searchKeyword: json['searchKeyword'] as String,
      suggestedGreeting: json['suggestedGreeting'] as String,
      estimatedPrice: json['estimatedPrice'] as int?,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  /// 쿠팡 검색 URL 생성
  String getCoupangUrl() {
    final encodedKeyword = Uri.encodeComponent(searchKeyword);
    return 'https://www.coupang.com/np/search?q=$encodedKeyword';
  }

  /// 가격 표시 문자열 생성 (천 단위 구분 기호 포함)
  String getFormattedPrice() {
    if (estimatedPrice == null) return '가격 문의';
    final formatter = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    final priceStr = estimatedPrice.toString();
    return '₩${priceStr.replaceAllMapped(formatter, (Match m) => '${m[1]},')}';
  }
}
