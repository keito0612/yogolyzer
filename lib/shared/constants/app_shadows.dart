import 'package:flutter/material.dart';

/// Yogolyzer のシャドウ (Elevation)
class AppShadows {
  AppShadows._();

  // ═══════════════════════════════════════════════
  // Elevation Levels
  // ═══════════════════════════════════════════════

  /// Level 1 - カード、リスト項目
  static List<BoxShadow> get elevation1 => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.03),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ];

  /// Level 2 - 浮いたカード、ドロップダウン
  static List<BoxShadow> get elevation2 => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 4,
          offset: const Offset(0, 1),
        ),
      ];

  /// Level 3 - モーダル、ボトムシート
  static List<BoxShadow> get elevation3 => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.12),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ];

  // ═══════════════════════════════════════════════
  // Aliases
  // ═══════════════════════════════════════════════

  static List<BoxShadow> get card => elevation1;
  static List<BoxShadow> get elevated => elevation2;
  static List<BoxShadow> get modal => elevation3;

  /// BottomNavigation用 (上方向のシャドウ)
  static List<BoxShadow> get bottomNav => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 8,
          offset: const Offset(0, -2),
        ),
      ];
}
