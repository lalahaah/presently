/// Presently 앱의 Spacing 시스템
/// 4px 기반 spacing scale
class AppSpacing {
  AppSpacing._();

  /// 4px
  static const double xs = 4.0;

  /// 8px
  static const double s = 8.0;

  /// 12px
  static const double sm = 12.0;

  /// 16px (기본 spacing)
  static const double m = 16.0;

  /// 20px
  static const double ml = 20.0;

  /// 24px
  static const double l = 24.0;

  /// 32px
  static const double xl = 32.0;

  /// 48px
  static const double xxl = 48.0;

  /// 64px
  static const double xxxl = 64.0;

  // ============================================================
  // Semantic Spacing
  // ============================================================

  /// 버튼 내부 padding
  static const double buttonPadding = m;

  /// 카드 내부 padding
  static const double cardPadding = m;

  /// 스크린 좌우 margin
  static const double screenHorizontal = l;

  /// 스크린 상하 margin
  static const double screenVertical = l;

  /// 리스트 아이템 간격
  static const double listItemGap = m;

  /// 섹션 간격
  static const double sectionGap = xl;
}
