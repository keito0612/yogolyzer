import 'package:flutter/material.dart';

/// Yogolyzer のスペーシング
/// 8ptグリッドシステム
class AppSpacing {
  AppSpacing._();

  // ═══════════════════════════════════════════════
  // Spacing Scale (8pt grid)
  // ═══════════════════════════════════════════════

  static const double space2 = 2;
  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space32 = 32;
  static const double space40 = 40;
  static const double space48 = 48;
  static const double space64 = 64;

  // Semantic aliases
  static const double xs = space4;
  static const double sm = space8;
  static const double md = space16;
  static const double lg = space24;
  static const double xl = space32;
  static const double xxl = space48;

  // ═══════════════════════════════════════════════
  // EdgeInsets
  // ═══════════════════════════════════════════════

  // Screen Padding
  static const EdgeInsets screenPadding = EdgeInsets.all(space16);
  static const EdgeInsets screenPaddingHorizontal = EdgeInsets.symmetric(
    horizontal: space16,
  );
  static const EdgeInsets screenPaddingVertical = EdgeInsets.symmetric(
    vertical: space16,
  );

  // Card Padding
  static const EdgeInsets cardPadding = EdgeInsets.all(space16);
  static const EdgeInsets cardPaddingCompact = EdgeInsets.all(space12);

  // List Item Padding
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: space16,
    vertical: space12,
  );

  // Button Padding
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: space24,
    vertical: space16,
  );
}
