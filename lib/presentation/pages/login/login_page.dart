import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_models/login/login_view_model.dart';

/// ログイン画面
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);
    final viewModel = ref.read(loginViewModelProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    // ログイン成功時に前の画面に戻る
    ref.listen<LoginState>(loginViewModelProvider, (previous, next) {
      next.whenOrNull(
        success: (userId, email, provider) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('ログインしました: $email'),
              backgroundColor: Colors.green,
            ),
          );
          // 前の画面に戻る
          if (context.canPop()) {
            context.pop(true);
          }
        },
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.red,
            ),
          );
          // エラー後にアイドル状態に戻す
          Future.microtask(() => viewModel.resetError());
        },
      );
    });

    final isLoading = state is LoginStateLoading;
    final loadingProvider = switch (state) {
      LoginStateLoading(:final provider) => provider,
      _ => null,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              // アプリロゴとタイトル
              Icon(
                Icons.cleaning_services,
                size: 80,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Yogolyzer',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                '汚れ診断AIアプリ',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),

              const Spacer(),

              // ログインのメリット説明
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'ログインすると',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    _buildBenefitItem(
                      context,
                      icon: Icons.cloud_sync,
                      text: 'データをクラウドにバックアップ',
                    ),
                    const SizedBox(height: 8),
                    _buildBenefitItem(
                      context,
                      icon: Icons.devices,
                      text: '機種変更時もデータを引き継ぎ',
                    ),
                    const SizedBox(height: 8),
                    _buildBenefitItem(
                      context,
                      icon: Icons.history,
                      text: '診断履歴を無制限で保存',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Apple でログイン
              _SocialLoginButton(
                onPressed: isLoading ? null : () => viewModel.signInWithApple(),
                icon: Icons.apple,
                label: 'Appleでログイン',
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                isLoading: loadingProvider == AuthProvider.apple,
              ),

              const SizedBox(height: 12),

              // Google でログイン
              _SocialLoginButton(
                onPressed:
                    isLoading ? null : () => viewModel.signInWithGoogle(),
                icon: Icons.g_mobiledata,
                label: 'Googleでログイン',
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                borderColor: Colors.grey.shade300,
                isLoading: loadingProvider == AuthProvider.google,
              ),

              const SizedBox(height: 24),

              // スキップボタン
              TextButton(
                onPressed: isLoading
                    ? null
                    : () {
                        if (context.canPop()) {
                          context.pop(false);
                        }
                      },
                child: Text(
                  'あとでログインする',
                  style: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 利用規約・プライバシーポリシー
              Text(
                'ログインすることで、利用規約と\nプライバシーポリシーに同意したことになります',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitItem(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

/// ソーシャルログインボタン
class _SocialLoginButton extends StatelessWidget {
  const _SocialLoginButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    this.borderColor,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none,
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: foregroundColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 24),
                  const SizedBox(width: 12),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
