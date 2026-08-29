import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_typography.dart';

/// Yogolyzer のローディングインジケーターウィジェット
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.message,
    this.size = LoadingIndicatorSize.medium,
    this.color,
  });

  /// ローディング中のメッセージ
  final String? message;

  /// インジケーターのサイズ
  final LoadingIndicatorSize size;

  /// インジケーターの色（nullでprimary）
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size.indicatorSize,
          height: size.indicatorSize,
          child: CircularProgressIndicator(
            strokeWidth: size.strokeWidth,
            color: color ?? AppColors.primary,
          ),
        ),
        if (message != null) ...[
          SizedBox(height: size.spacing),
          Text(
            message!,
            style: size.textStyle.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

/// ローディングインジケーターのサイズ
enum LoadingIndicatorSize {
  small(
    indicatorSize: 20,
    strokeWidth: 2,
    spacing: 8,
    textStyle: AppTypography.bodySmall,
  ),
  medium(
    indicatorSize: 32,
    strokeWidth: 3,
    spacing: 12,
    textStyle: AppTypography.bodyMedium,
  ),
  large(
    indicatorSize: 48,
    strokeWidth: 4,
    spacing: 16,
    textStyle: AppTypography.bodyLarge,
  );

  const LoadingIndicatorSize({
    required this.indicatorSize,
    required this.strokeWidth,
    required this.spacing,
    required this.textStyle,
  });

  final double indicatorSize;
  final double strokeWidth;
  final double spacing;
  final TextStyle textStyle;
}

/// フルスクリーンローディングオーバーレイ
class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    this.message,
    this.backgroundColor,
  });

  /// ローディング中のメッセージ
  final String? message;

  /// 背景色
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.black.withValues(alpha: 0.3),
      child: Center(
        child: LoadingIndicator(
          message: message,
          size: LoadingIndicatorSize.large,
        ),
      ),
    );
  }
}
