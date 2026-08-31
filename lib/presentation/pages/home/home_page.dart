import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../router/app_routes.dart';
import '../../view_models/home/home_view_model.dart';
import '../../widgets/app_button.dart';

/// ホーム画面
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.read(homeViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yogolyzer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => context.go(AppRoutes.history),
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildContent(context, state, viewModel),
    );
  }

  Widget _buildContent(
    BuildContext context,
    HomeState state,
    HomeViewModel viewModel,
  ) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(flex: 2),

            // メインイラスト
            _buildIllustration(),

            const SizedBox(height: 32),

            // 説明テキスト
            _buildDescription(context),

            const SizedBox(height: 40),

            // 診断開始ボタン
            _buildStartButton(context, viewModel),

            const SizedBox(height: 24),

            // 本日の診断回数
            _buildDiagnosisCount(context, state, viewModel),

            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.cleaning_services_outlined,
        size: 80,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Column(
      children: [
        Text(
          '汚れを撮影して',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          '最適な掃除方法を見つけましょう',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
      ],
    );
  }

  Widget _buildStartButton(BuildContext context, HomeViewModel viewModel) {
    return AppButton(
      onPressed: viewModel.canDiagnose
          ? () => context.go(AppRoutes.camera)
          : null,
      icon: Icons.camera_alt,
      label: '診断を始める',
    );
  }

  Widget _buildDiagnosisCount(
    BuildContext context,
    HomeState state,
    HomeViewModel viewModel,
  ) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            state.isPremium ? Icons.star : Icons.today,
            size: 16,
            color: state.isPremium ? AppColors.warning : AppColors.textSecondary,
          ),
          const SizedBox(width: 8),
          Text(
            state.isPremium
                ? 'プレミアム: 無制限'
                : '今日の診断: ${viewModel.remainingCountText}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
        ],
      ),
    );
  }
}
