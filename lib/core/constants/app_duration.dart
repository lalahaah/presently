/// Presently 앱의 Animation Duration 시스템
class AppDuration {
  AppDuration._();

  // ============================================================
  // Standard Durations
  // ============================================================

  /// 매우 짧음 - 100ms
  /// 미세한 피드백, 리플 효과
  static const Duration veryShort = Duration(milliseconds: 100);

  /// 짧음 - 200ms
  /// 일반적인 전환, 페이드
  static const Duration short = Duration(milliseconds: 200);

  /// 중간 - 300ms
  /// 모달, 다이얼로그 등장
  static const Duration medium = Duration(milliseconds: 300);

  /// 길음 - 500ms
  /// 페이지 전환
  static const Duration long = Duration(milliseconds: 500);

  /// 매우 길음 - 800ms
  /// 특별한 애니메이션
  static const Duration veryLong = Duration(milliseconds: 800);

  // ============================================================
  // Component-specific Durations
  // ============================================================

  /// Choice Chip 클릭 시 Scale 애니메이션 (Scale down 0.95)
  static const Duration choiceChipPress = Duration(milliseconds: 150);

  /// Card Swipe 애니메이션 (탄성 효과)
  static const Duration cardSwipe = medium;

  /// Progress Indicator Filling 효과
  static const Duration progressFill = long;

  /// Pulse 애니메이션 (AI 분석 단계)
  static const Duration pulse = Duration(milliseconds: 1000);

  /// Magic Loading - 반짝이는 입자(Particle) 효과
  static const Duration magicLoading = Duration(milliseconds: 1500);

  /// Success Feedback 애니메이션
  static const Duration successFeedback = medium;

  /// Button Press
  static const Duration buttonPress = veryShort;

  /// Dialog 등장/사라짐
  static const Duration dialog = medium;

  /// Bottom Sheet 슬라이드
  static const Duration bottomSheet = medium;

  /// Snackbar 등장
  static const Duration snackbar = short;

  /// Page Transition
  static const Duration pageTransition = medium;
}
