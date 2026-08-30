import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constants/app_colors.dart';
import '../../router/app_routes.dart';
import '../../view_models/splash/splash_view_model.dart';

/// スプラッシュ画面
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    // 初期化処理を開始
    Future.microtask(() {
      ref.read(splashViewModelProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    // 状態を監視して遷移
    ref.listen<SplashState>(splashViewModelProvider, (previous, next) {
      next.when(
        loading: () {},
        navigateToOnboarding: () => context.go(AppRoutes.onboarding),
        navigateToHome: () => context.go(AppRoutes.home),
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              AppColors.primaryDark,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // アプリロゴ
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.cleaning_services,
                    size: 48,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 24),

                // アプリ名
                Text(
                  'Yogolyzer',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),

                const SizedBox(height: 8),

                // サブタイトル
                Text(
                  '汚れ診断AI',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                ),

                const SizedBox(height: 48),

                // ローディングインジケーター
                const SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
