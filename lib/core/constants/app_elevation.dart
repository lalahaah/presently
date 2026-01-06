/// Presently 앱의 Elevation 및 Shadow 시스템
class AppElevation {
  AppElevation._();

  // ============================================================
  // Elevation Levels (dp)
  // ============================================================

  /// 레벨 0 - 그림자 없음
  static const double level0 = 0.0;

  /// 레벨 1 - 미세한 그림자 (2dp)
  static const double level1 = 2.0;

  /// 레벨 2 - 기본 그림자 (4dp)
  static const double level2 = 4.0;

  /// 레벨 3 - 중간 그림자 (8dp)
  static const double level3 = 8.0;

  /// 레벨 4 - 높은 그림자 (12dp)
  static const double level4 = 12.0;

  /// 레벨 5 - 매우 높은 그림자 (16dp)
  static const double level5 = 16.0;

  // ============================================================
  // Component-specific Elevation
  // ============================================================

  /// Choice Chip (선택된 상태) - Selected chip에 elevation shadow
  static const double choiceChipSelected = level2;

  /// Recommendation Card - 기본 카드
  static const double card = level1;

  /// Recommendation Card (hover/pressed)
  static const double cardHover = level3;

  /// Button
  static const double button = level1;

  /// Button (pressed)
  static const double buttonPressed = level0;

  /// Dialog
  static const double dialog = level4;

  /// Bottom Sheet
  static const double bottomSheet = level5;

  /// App Bar
  static const double appBar = level0;

  /// FAB (Floating Action Button)
  static const double fab = level3;
}
