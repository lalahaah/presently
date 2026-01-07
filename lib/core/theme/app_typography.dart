import 'package:flutter/material.dart';

/// Presently 앱의 타이포그래피 시스템
/// Design System v1.0 기반 (Pretendard 폰트 사용)
/// - Pretendard: 한국어와 영어 모두에 최적화된 폰트
/// - Google Fonts 대신 로컬 폰트 사용하여 성능 향상
class AppTypography {
  AppTypography._();

  // Pretendard 폰트 패밀리
  static const String _fontFamily = 'Pretendard';

  // ============================================================
  // Display Styles
  // ============================================================

  /// Display - 32pt Bold
  /// 홈 화면 인사말 등에 사용
  static TextStyle display({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: color,
    letterSpacing: -0.5,
    height: 1.3,
  );

  // ============================================================
  // Heading Styles
  // ============================================================

  /// Heading 1 - 24pt Semi-bold
  /// 섹션 타이틀
  static TextStyle heading1({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: -0.3,
    height: 1.3,
  );

  /// Heading 2 - 20pt Semi-bold
  static TextStyle heading2({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: -0.2,
    height: 1.4,
  );

  /// Heading 3 - 18pt Medium
  static TextStyle heading3({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: color,
    height: 1.4,
  );

  // ============================================================
  // Body Styles
  // ============================================================

  /// Body - 16pt Regular
  /// 추천 사유, 설명글
  static TextStyle body({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color,
    height: 1.5,
  );

  /// Body Bold - 16pt Bold
  static TextStyle bodyBold({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: color,
    height: 1.5,
  );

  /// Body Medium - 16pt Medium
  static TextStyle bodyMedium({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: color,
    height: 1.5,
  );

  /// Body Small - 14pt Regular
  static TextStyle bodySmall({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color,
    height: 1.4,
  );

  // ============================================================
  // Caption & Label Styles
  // ============================================================

  /// Caption - 12pt Medium
  /// 부가 정보, 태그
  static TextStyle caption({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: color,
    height: 1.3,
  );

  /// Caption Small - 10pt Medium
  static TextStyle captionSmall({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: color,
    height: 1.2,
  );

  /// Label - 14pt Semi-bold
  /// 버튼 텍스트 등
  static TextStyle label({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0.2,
  );

  /// Label Large - 16pt Semi-bold
  static TextStyle labelLarge({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0.2,
  );

  // ============================================================
  // Special Styles
  // ============================================================

  /// AI Comment - Italic
  /// AI 코멘트용 이탤릭 스타일
  static TextStyle aiComment({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: color,
    height: 1.4,
  );

  /// Price Indicator - 18pt Bold
  /// $$$ 가격 표시
  static TextStyle priceIndicator({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: color,
    letterSpacing: 0.5,
  );

  /// Button Text - 14pt Bold
  static TextStyle button({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: color,
    letterSpacing: 0.5,
  );

  // ============================================================
  // Material TextTheme Generator
  // ============================================================

  /// Light mode용 TextTheme 생성
  static TextTheme createLightTextTheme() {
    return TextTheme(
      displayLarge: display(),
      displayMedium: display(),
      displaySmall: display(),
      headlineLarge: heading1(),
      headlineMedium: heading2(),
      headlineSmall: heading3(),
      titleLarge: heading1(),
      titleMedium: heading2(),
      titleSmall: heading3(),
      bodyLarge: body(),
      bodyMedium: bodyMedium(),
      bodySmall: bodySmall(),
      labelLarge: labelLarge(),
      labelMedium: label(),
      labelSmall: caption(),
    );
  }

  /// Dark mode용 TextTheme 생성
  static TextTheme createDarkTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: display(color: textColor),
      displayMedium: display(color: textColor),
      displaySmall: display(color: textColor),
      headlineLarge: heading1(color: textColor),
      headlineMedium: heading2(color: textColor),
      headlineSmall: heading3(color: textColor),
      titleLarge: heading1(color: textColor),
      titleMedium: heading2(color: textColor),
      titleSmall: heading3(color: textColor),
      bodyLarge: body(color: textColor),
      bodyMedium: bodyMedium(color: textColor),
      bodySmall: bodySmall(color: textColor),
      labelLarge: labelLarge(color: textColor),
      labelMedium: label(color: textColor),
      labelSmall: caption(color: textColor),
    );
  }
}
