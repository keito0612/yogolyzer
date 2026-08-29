import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'app_typography.dart';

/// Yogolyzer のテーマ設定
class AppTheme {
  AppTheme._();

  /// ライトテーマ
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: _lightColorScheme,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: _textTheme,
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonTheme,
      cardTheme: _cardTheme,
      inputDecorationTheme: _inputDecorationTheme,
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      chipTheme: _chipTheme,
      dialogTheme: _dialogTheme,
      bottomSheetTheme: _bottomSheetTheme,
      snackBarTheme: _snackBarTheme,
      dividerTheme: _dividerTheme,
      listTileTheme: _listTileTheme,
      iconTheme: _iconTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
    );
  }

  // ═══════════════════════════════════════════════
  // Color Scheme
  // ═══════════════════════════════════════════════

  static ColorScheme get _lightColorScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.textOnPrimary,
      primaryContainer: AppColors.primaryLight,
      secondary: AppColors.secondary,
      onSecondary: AppColors.textOnPrimary,
      secondaryContainer: AppColors.secondaryLight,
      error: AppColors.error,
      onError: AppColors.textOnPrimary,
      errorContainer: AppColors.errorLight,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      surfaceContainerHighest: AppColors.background,
      outline: AppColors.divider,
      outlineVariant: AppColors.border,
    );
  }

  // ═══════════════════════════════════════════════
  // Text Theme
  // ═══════════════════════════════════════════════

  static TextTheme get _textTheme {
    return GoogleFonts.notoSansTextTheme().copyWith(
      displayLarge: AppTypography.displayLarge,
      displayMedium: AppTypography.displayMedium,
      displaySmall: AppTypography.displaySmall,
      headlineLarge: AppTypography.headlineLarge,
      headlineMedium: AppTypography.headlineMedium,
      headlineSmall: AppTypography.headlineSmall,
      titleLarge: AppTypography.titleLarge,
      titleMedium: AppTypography.titleMedium,
      titleSmall: AppTypography.titleSmall,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
      labelLarge: AppTypography.labelLarge,
      labelMedium: AppTypography.labelMedium,
      labelSmall: AppTypography.labelSmall,
    );
  }

  // ═══════════════════════════════════════════════
  // AppBar Theme
  // ═══════════════════════════════════════════════

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.textPrimary,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: AppColors.textPrimary,
        size: 24,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.textPrimary,
        size: 24,
      ),
      titleTextStyle: AppTypography.titleLarge,
    );
  }

  // ═══════════════════════════════════════════════
  // Button Themes
  // ═══════════════════════════════════════════════

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        backgroundColor: AppColors.buttonPrimaryBg,
        foregroundColor: AppColors.buttonPrimaryFg,
        disabledBackgroundColor: AppColors.buttonDisabledBg,
        disabledForegroundColor: AppColors.buttonDisabledFg,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.buttonAll,
        ),
        textStyle: AppTypography.labelLarge,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        foregroundColor: AppColors.primary,
        disabledForegroundColor: AppColors.buttonDisabledFg,
        elevation: 0,
        side: const BorderSide(color: AppColors.primary, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.buttonAll,
        ),
        textStyle: AppTypography.labelLarge,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    );
  }

  static TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        disabledForegroundColor: AppColors.buttonDisabledFg,
        textStyle: AppTypography.labelLarge,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.buttonAll,
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════
  // Card Theme
  // ═══════════════════════════════════════════════

  static CardThemeData get _cardTheme {
    return CardThemeData(
      elevation: 0,
      color: AppColors.cardBg,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.cardAll,
      ),
      margin: EdgeInsets.zero,
    );
  }

  // ═══════════════════════════════════════════════
  // Input Decoration Theme
  // ═══════════════════════════════════════════════

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBg,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: AppRadius.inputAll,
        borderSide: const BorderSide(color: AppColors.inputBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.inputAll,
        borderSide: const BorderSide(color: AppColors.inputBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.inputAll,
        borderSide: const BorderSide(color: AppColors.inputFocusBorder, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.inputAll,
        borderSide: const BorderSide(color: AppColors.inputErrorBorder),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppRadius.inputAll,
        borderSide: const BorderSide(color: AppColors.inputErrorBorder, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.inputAll,
        borderSide: BorderSide(color: AppColors.inputBorder.withValues(alpha: 0.5)),
      ),
      labelStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
      hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textDisabled),
      errorStyle: AppTypography.bodySmall.copyWith(color: AppColors.error),
      helperStyle: AppTypography.bodySmall,
    );
  }

  // ═══════════════════════════════════════════════
  // Bottom Navigation Bar Theme
  // ═══════════════════════════════════════════════

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme {
    return const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.navActive,
      unselectedItemColor: AppColors.navInactive,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: AppTypography.labelSmall,
      unselectedLabelStyle: AppTypography.labelSmall,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }

  // ═══════════════════════════════════════════════
  // Chip Theme
  // ═══════════════════════════════════════════════

  static ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: AppColors.chipUnselectedBg,
      selectedColor: AppColors.chipSelectedBg,
      disabledColor: AppColors.buttonDisabledBg,
      labelStyle: AppTypography.bodyMedium,
      secondaryLabelStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.chipSelectedFg,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.chipAll,
        side: const BorderSide(color: AppColors.chipUnselectedBorder),
      ),
      side: const BorderSide(color: AppColors.chipUnselectedBorder),
      showCheckmark: false,
    );
  }

  // ═══════════════════════════════════════════════
  // Dialog Theme
  // ═══════════════════════════════════════════════

  static DialogThemeData get _dialogTheme {
    return DialogThemeData(
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.lgAll,
      ),
      titleTextStyle: AppTypography.titleLarge,
      contentTextStyle: AppTypography.bodyMedium,
    );
  }

  // ═══════════════════════════════════════════════
  // Bottom Sheet Theme
  // ═══════════════════════════════════════════════

  static BottomSheetThemeData get _bottomSheetTheme {
    return BottomSheetThemeData(
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.bottomSheetTop,
      ),
      showDragHandle: true,
      dragHandleColor: AppColors.divider,
      dragHandleSize: const Size(32, 4),
    );
  }

  // ═══════════════════════════════════════════════
  // SnackBar Theme
  // ═══════════════════════════════════════════════

  static SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      backgroundColor: AppColors.gray900,
      contentTextStyle: AppTypography.bodyMedium.copyWith(
        color: Colors.white,
      ),
      actionTextColor: AppColors.primaryLight,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.smAll,
      ),
    );
  }

  // ═══════════════════════════════════════════════
  // Divider Theme
  // ═══════════════════════════════════════════════

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 1,
    );
  }

  // ═══════════════════════════════════════════════
  // ListTile Theme
  // ═══════════════════════════════════════════════

  static ListTileThemeData get _listTileTheme {
    return ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minVerticalPadding: 12,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.mdAll,
      ),
      titleTextStyle: AppTypography.bodyLarge,
      subtitleTextStyle: AppTypography.bodySmall,
      leadingAndTrailingTextStyle: AppTypography.bodyMedium,
      iconColor: AppColors.textSecondary,
    );
  }

  // ═══════════════════════════════════════════════
  // Icon Theme
  // ═══════════════════════════════════════════════

  static IconThemeData get _iconTheme {
    return const IconThemeData(
      color: AppColors.textPrimary,
      size: 24,
    );
  }

  // ═══════════════════════════════════════════════
  // Progress Indicator Theme
  // ═══════════════════════════════════════════════

  static ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: AppColors.primary,
      linearTrackColor: AppColors.primaryLight,
      circularTrackColor: AppColors.primaryLight,
    );
  }
}
