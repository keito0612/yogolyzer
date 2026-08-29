import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_typography.dart';

/// Yogolyzer の共通テキストフィールドウィジェット
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
  });

  /// テキストコントローラー
  final TextEditingController? controller;

  /// ラベルテキスト
  final String? label;

  /// ヒントテキスト
  final String? hint;

  /// ヘルパーテキスト
  final String? helperText;

  /// エラーテキスト
  final String? errorText;

  /// 先頭アイコン
  final IconData? prefixIcon;

  /// 末尾アイコン
  final IconData? suffixIcon;

  /// 末尾アイコンタップ時のコールバック
  final VoidCallback? onSuffixIconTap;

  /// パスワード入力モード
  final bool obscureText;

  /// 有効状態
  final bool enabled;

  /// 読み取り専用
  final bool readOnly;

  /// 最大行数
  final int? maxLines;

  /// 最小行数
  final int? minLines;

  /// 最大文字数
  final int? maxLength;

  /// キーボードタイプ
  final TextInputType? keyboardType;

  /// キーボードのアクションボタン
  final TextInputAction? textInputAction;

  /// 入力フォーマッター
  final List<TextInputFormatter>? inputFormatters;

  /// テキスト変更時のコールバック
  final ValueChanged<String>? onChanged;

  /// 送信時のコールバック
  final ValueChanged<String>? onSubmitted;

  /// タップ時のコールバック
  final VoidCallback? onTap;

  /// フォーカスノード
  final FocusNode? focusNode;

  /// オートフォーカス
  final bool autofocus;

  /// テキストの大文字化
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppTypography.labelMedium.copyWith(
              color: errorText != null ? AppColors.error : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          enabled: enabled,
          readOnly: readOnly,
          maxLines: obscureText ? 1 : maxLines,
          minLines: minLines,
          maxLength: maxLength,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onTap: onTap,
          autofocus: autofocus,
          textCapitalization: textCapitalization,
          style: AppTypography.bodyLarge,
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            helperText: helperText,
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: AppColors.textSecondary)
                : null,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon, color: AppColors.textSecondary),
                    onPressed: onSuffixIconTap,
                  )
                : null,
            counterText: '',
          ),
        ),
      ],
    );
  }
}
