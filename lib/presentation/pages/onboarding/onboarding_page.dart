import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../router/app_routes.dart';
import '../../view_models/onboarding/onboarding_view_model.dart';

/// オンボーディング画面
class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final state = ref.watch(onboardingViewModelProvider);
    final viewModel = ref.read(onboardingViewModelProvider.notifier);

    // 状態変更を監視して遷移
    ref.listen<OnboardingState>(onboardingViewModelProvider, (previous, next) {
      next.when(
        viewing: (_) {},
        completed: () => context.go(AppRoutes.home),
      );
    });

    // ページ変更を同期
    useEffect(() {
      state.whenOrNull(
        viewing: (currentPage) {
          if (pageController.hasClients &&
              pageController.page?.round() != currentPage) {
            pageController.animateToPage(
              currentPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
      );
      return null;
    }, [state]);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // スキップボタン
            _buildSkipButton(viewModel),

            // ページコンテンツ
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: viewModel.onPageChanged,
                children: const [
                  _OnboardingSlide(
                    icon: Icons.camera_alt_outlined,
                    title: '汚れを撮影するだけ',
                    description: '気になる汚れをカメラで撮影するだけで\n最適な掃除方法がわかります',
                  ),
                  _OnboardingSlide(
                    icon: Icons.psychology_outlined,
                    title: 'AIが汚れを診断',
                    description: 'AIが汚れの種類を自動で判定\n油汚れ、カビ、水垢など正確に識別',
                  ),
                  _OnboardingSlide(
                    icon: Icons.cleaning_services_outlined,
                    title: '洗剤と手順を提案',
                    description: 'おすすめの洗剤と\nステップバイステップの掃除手順を表示',
                  ),
                ],
              ),
            ),

            // ページインジケーター
            _buildPageIndicator(state),

            const SizedBox(height: 32),

            // 次へ / 始めるボタン
            _buildActionButton(viewModel),

            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton(OnboardingViewModel viewModel) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextButton(
          onPressed: viewModel.skip,
          child: Text(
            'スキップ',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(OnboardingState state) {
    final currentPage = state.maybeWhen(
      viewing: (page) => page,
      orElse: () => OnboardingViewModel.totalPages - 1,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        OnboardingViewModel.totalPages,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == currentPage ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == currentPage
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(OnboardingViewModel viewModel) {
    final isLastPage = viewModel.isLastPage;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: isLastPage ? viewModel.complete : viewModel.nextPage,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            isLastPage ? '始める' : '次へ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

/// オンボーディングスライド
class _OnboardingSlide extends StatelessWidget {
  const _OnboardingSlide({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // アイコン
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 60,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 48),

          // タイトル
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // 説明
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
