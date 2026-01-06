/// Presently 앱의 Icon Size 시스템
class AppIconSize {
  AppIconSize._();

  // ============================================================
  // Standard Icon Sizes
  // ============================================================

  /// 12px - 매우 작은 아이콘
  static const double xs = 12.0;

  /// 16px - 작은 아이콘
  static const double s = 16.0;

  /// 20px - 기본 아이콘
  static const double m = 20.0;

  /// 24px - 중간 아이콘
  static const double l = 24.0;

  /// 32px - 큰 아이콘
  static const double xl = 32.0;

  /// 48px - 매우 큰 아이콘
  static const double xxl = 48.0;

  /// 64px - 특대 아이콘
  static const double xxxl = 64.0;

  // ============================================================
  // Component-specific Icon Sizes
  // ============================================================

  /// App Bar leading/actions
  static const double appBar = l;

  /// Bottom Navigation
  static const double bottomNav = l;

  /// FAB
  static const double fab = l;

  /// Button 내부 아이콘
  static const double button = m;

  /// List Item
  static const double listItem = l;

  /// Badge/Chip 내부 아이콘
  static const double chip = s;

  /// Avatar 오버레이 아이콘
  static const double avatarOverlay = m;

  /// Dialog 헤더 아이콘
  static const double dialogHeader = xl;
}
