import 'package:flutter/material.dart';

/// Presently 앱의 컬러 팔레트
/// Design System v1.0 'Modern Luxury' 테마 기반
class AppColors {
  AppColors._();

  // ============================================================
  // Brand Colors (브랜드 컬러)
  // ============================================================

  /// Primary - Golden Oak
  /// 선물, 프리미엄, 가치를 상징하는 골드 컬러
  static const Color primary = Color(0xFFD4AF37);

  /// Secondary - Charcoal Black
  /// 텍스트 및 주요 배경, 세련됨과 깊이감 제공
  static const Color secondary = Color(0xFF1A1A1A);

  /// Surface - Soft Bone
  /// 편안한 읽기 경험을 위한 배경색
  static const Color surface = Color(0xFFF9F8F6);

  /// Accent - Soft Emerald
  /// '추천 성공', '구매 완료' 등 긍정적 인터랙션용
  static const Color accent = Color(0xFF2D5A27);

  /// Error - Deep Rose
  /// 오류 및 경고
  static const Color error = Color(0xFFBC4749);

  // ============================================================
  // Semantic Colors - Light Mode
  // ============================================================

  static const Color lightBackground = surface;
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnBackground = secondary;
  static const Color lightOnSurface = secondary;
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightOnSecondary = Color(0xFFFFFFFF);
  static const Color lightOnAccent = Color(0xFFFFFFFF);
  static const Color lightOnError = Color(0xFFFFFFFF);

  /// Border colors
  static const Color lightBorder = Color(0xFFE0E0E0);
  static const Color lightDivider = Color(0xFFE0E0E0);

  // ============================================================
  // Semantic Colors - Dark Mode
  // ============================================================

  static const Color darkBackground = secondary;
  static const Color darkSurface = Color(0xFF2A2A2A);
  static const Color darkOnBackground = surface;
  static const Color darkOnSurface = surface;
  static const Color darkOnPrimary = Color(0xFF1A1A1A);

  /// Dark mode에서는 골드 컬러의 채도를 살짝 낮춤
  static const Color darkPrimary = Color(0xFFC9A85F);
  static const Color darkOnSecondary = Color(0xFFFFFFFF);
  static const Color darkOnAccent = Color(0xFFFFFFFF);
  static const Color darkOnError = Color(0xFFFFFFFF);

  /// Border colors
  static const Color darkBorder = Color(0xFF3A3A3A);
  static const Color darkDivider = Color(0xFF3A3A3A);

  // ============================================================
  // Utility Colors
  // ============================================================

  /// Success (동일한 accent 사용)
  static const Color success = accent;

  /// Warning
  static const Color warning = Color(0xFFF59E0B);

  /// Info
  static const Color info = Color(0xFF3B82F6);

  /// Disabled state
  static const Color disabled = Color(0xFFBDBDBD);

  /// Overlay (for modals, dialogs)
  static const Color overlay = Color(0x80000000);

  // ============================================================
  // Special Colors
  // ============================================================

  /// 가격 표시용 ($$$ 인디케이터)
  static const Color priceIndicator = primary;

  /// AI Badge 배경
  static const Color aiBadge = primary;

  /// 투명
  static const Color transparent = Colors.transparent;
}
