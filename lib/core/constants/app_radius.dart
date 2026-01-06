import 'package:flutter/material.dart';

/// Presently 앱의 Border Radius 시스템
class AppRadius {
  AppRadius._();

  // ============================================================
  // Radius Values
  // ============================================================

  /// 4px - 작은 요소
  static const double xs = 4.0;

  /// 8px - 기본 요소
  static const double s = 8.0;

  /// 12px - 중간 요소
  static const double m = 12.0;

  /// 16px - Recommendation Card
  static const double l = 16.0;

  /// 20px - Choice Chip
  static const double xl = 20.0;

  /// 24px - 큰 요소
  static const double xxl = 24.0;

  /// 999px - 완전히 둥근 형태
  static const double full = 999.0;

  // ============================================================
  // BorderRadius Objects
  // ============================================================

  static const BorderRadius radiusXS = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius radiusS = BorderRadius.all(Radius.circular(s));
  static const BorderRadius radiusM = BorderRadius.all(Radius.circular(m));
  static const BorderRadius radiusL = BorderRadius.all(Radius.circular(l));
  static const BorderRadius radiusXL = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius radiusXXL = BorderRadius.all(Radius.circular(xxl));
  static const BorderRadius radiusFull = BorderRadius.all(
    Radius.circular(full),
  );

  // ============================================================
  // Component-specific Radius
  // ============================================================

  /// Choice Chip - 20px
  static const double choiceChip = xl;
  static const BorderRadius choiceChipRadius = radiusXL;

  /// Recommendation Card - 16px
  static const double recommendationCard = l;
  static const BorderRadius recommendationCardRadius = radiusL;

  /// Button - 12px
  static const double button = m;
  static const BorderRadius buttonRadius = radiusM;

  /// Input Field - 8px
  static const double input = s;
  static const BorderRadius inputRadius = radiusS;

  /// Dialog - 16px
  static const double dialog = l;
  static const BorderRadius dialogRadius = radiusL;

  /// Bottom Sheet - 상단만 둥글게
  static const BorderRadius bottomSheet = BorderRadius.only(
    topLeft: Radius.circular(l),
    topRight: Radius.circular(l),
  );
}
