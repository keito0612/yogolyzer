import 'package:flutter/material.dart';

/// Yogolyzer のカラーパレット
/// 3層トークンシステム: Primitive → Semantic → Component
class AppColors {
  AppColors._();

  // ═══════════════════════════════════════════════
  // Primitive Layer - 生の色値
  // ═══════════════════════════════════════════════

  // Blue Scale
  static const Color blue50 = Color(0xFFE3F2FD);
  static const Color blue100 = Color(0xFFBBDEFB);
  static const Color blue200 = Color(0xFF90CAF9);
  static const Color blue300 = Color(0xFF64B5F6);
  static const Color blue400 = Color(0xFF42A5F5);
  static const Color blue500 = Color(0xFF2196F3);
  static const Color blue600 = Color(0xFF1E88E5);
  static const Color blue700 = Color(0xFF1976D2);
  static const Color blue800 = Color(0xFF1565C0);
  static const Color blue900 = Color(0xFF0D47A1);

  // Green Scale
  static const Color green50 = Color(0xFFE8F5E9);
  static const Color green100 = Color(0xFFC8E6C9);
  static const Color green200 = Color(0xFFA5D6A7);
  static const Color green300 = Color(0xFF81C784);
  static const Color green400 = Color(0xFF66BB6A);
  static const Color green500 = Color(0xFF4CAF50);
  static const Color green600 = Color(0xFF43A047);
  static const Color green700 = Color(0xFF388E3C);

  // Red Scale
  static const Color red50 = Color(0xFFFFEBEE);
  static const Color red100 = Color(0xFFFFCDD2);
  static const Color red200 = Color(0xFFEF9A9A);
  static const Color red300 = Color(0xFFE57373);
  static const Color red400 = Color(0xFFEF5350);
  static const Color red500 = Color(0xFFF44336);
  static const Color red600 = Color(0xFFE53935);
  static const Color red700 = Color(0xFFD32F2F);

  // Amber Scale
  static const Color amber50 = Color(0xFFFFF8E1);
  static const Color amber100 = Color(0xFFFFECB3);
  static const Color amber200 = Color(0xFFFFE082);
  static const Color amber300 = Color(0xFFFFD54F);
  static const Color amber400 = Color(0xFFFFCA28);
  static const Color amber500 = Color(0xFFFFC107);
  static const Color amber600 = Color(0xFFFFB300);
  static const Color amber700 = Color(0xFFFFA000);

  // Gray Scale
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFEEEEEE);
  static const Color gray300 = Color(0xFFE0E0E0);
  static const Color gray400 = Color(0xFFBDBDBD);
  static const Color gray500 = Color(0xFF9E9E9E);
  static const Color gray600 = Color(0xFF757575);
  static const Color gray700 = Color(0xFF616161);
  static const Color gray800 = Color(0xFF424242);
  static const Color gray900 = Color(0xFF212121);

  // ═══════════════════════════════════════════════
  // Semantic Layer - 用途に基づく色
  // ═══════════════════════════════════════════════

  // Brand Colors
  static const Color primary = blue500;
  static const Color primaryLight = blue100;
  static const Color primaryDark = blue700;
  static const Color secondary = green500;
  static const Color secondaryLight = green100;

  // Feedback Colors
  static const Color success = green500;
  static const Color successLight = green50;
  static const Color warning = amber500;
  static const Color warningLight = amber50;
  static const Color error = red500;
  static const Color errorLight = red50;
  static const Color info = blue500;
  static const Color infoLight = blue50;

  // Surface Colors
  static const Color background = gray100;
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = gray50;

  // Text Colors
  static const Color textPrimary = gray900;
  static const Color textSecondary = gray700;
  static const Color textDisabled = gray500;
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Border/Divider
  static const Color divider = gray300;
  static const Color border = gray200;

  // ═══════════════════════════════════════════════
  // Component Layer - コンポーネント固有
  // ═══════════════════════════════════════════════

  // Button
  static const Color buttonPrimaryBg = primary;
  static const Color buttonPrimaryFg = Color(0xFFFFFFFF);
  static const Color buttonSecondaryBg = surface;
  static const Color buttonSecondaryFg = primary;
  static const Color buttonDisabledBg = gray200;
  static const Color buttonDisabledFg = gray500;

  // Input
  static const Color inputBg = background;
  static const Color inputBorder = divider;
  static const Color inputFocusBorder = primary;
  static const Color inputErrorBorder = error;

  // Card
  static const Color cardBg = surface;
  static const Color cardBorder = border;

  // Chip (Selection)
  static const Color chipUnselectedBg = background;
  static const Color chipUnselectedBorder = divider;
  static const Color chipSelectedBg = primary;
  static const Color chipSelectedFg = Color(0xFFFFFFFF);

  // Bottom Navigation
  static const Color navActive = primary;
  static const Color navInactive = textSecondary;
}
