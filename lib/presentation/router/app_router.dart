import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../pages/camera/camera_page.dart';
import '../pages/diagnosing/diagnosing_page.dart';
import '../pages/diagnosis_result/diagnosis_result_page.dart';
import '../pages/history/history_page.dart';
import '../pages/history_detail/history_detail_page.dart';
import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';
import '../pages/onboarding/onboarding_page.dart';
import '../pages/settings/settings_page.dart';
import '../pages/select_location/select_location_page.dart';
import '../pages/select_material/select_material_page.dart';
import '../pages/shell/main_shell_page.dart';
import '../pages/splash/splash_page.dart';
import '../view_models/select_location/select_location_view_model.dart';
import 'app_routes.dart';

/// ナビゲーションキー
final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

/// GoRouterプロバイダー
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    routes: [
      // スプラッシュ画面
      GoRoute(
        path: AppRoutes.splash,
        name: AppRouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),

      // オンボーディング画面
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRouteNames.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),

      // メインシェル（BottomNavigation付き）
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => MainShellPage(child: child),
        routes: [
          // ホーム
          GoRoute(
            path: AppRoutes.home,
            name: AppRouteNames.home,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),

          // 履歴一覧
          GoRoute(
            path: AppRoutes.history,
            name: AppRouteNames.history,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HistoryPage(),
            ),
          ),

          // 設定
          GoRoute(
            path: AppRoutes.settings,
            name: AppRouteNames.settings,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SettingsPage(),
            ),
          ),
        ],
      ),

      // カメラ画面
      GoRoute(
        path: AppRoutes.camera,
        name: AppRouteNames.camera,
        builder: (context, state) => const CameraPage(),
      ),

      // 場所選択画面
      GoRoute(
        path: AppRoutes.selectLocation,
        name: AppRouteNames.selectLocation,
        builder: (context, state) {
          final imagePath = state.extra as String? ?? '';
          return SelectLocationPage(imagePath: imagePath);
        },
      ),

      // 素材選択画面
      GoRoute(
        path: AppRoutes.selectMaterial,
        name: AppRouteNames.selectMaterial,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          final imagePath = extra['imagePath'] as String? ?? '';
          final location = extra['location'] as String? ?? '';
          final locationType = extra['locationType'] as LocationType?;
          return SelectMaterialPage(
            imagePath: imagePath,
            locationName: location,
            locationType: locationType,
          );
        },
      ),

      // 診断中画面
      GoRoute(
        path: AppRoutes.diagnosing,
        name: AppRouteNames.diagnosing,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          final imagePath = extra['imagePath'] as String? ?? '';
          final location = extra['location'] as String? ?? '';
          final material = extra['material'] as String? ?? '';
          return DiagnosingPage(
            imagePath: imagePath,
            location: location,
            material: material,
          );
        },
      ),

      // 診断結果画面
      GoRoute(
        path: AppRoutes.result,
        name: AppRouteNames.result,
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return DiagnosisResultPage(diagnosisId: id);
        },
      ),

      // 履歴詳細画面
      GoRoute(
        path: AppRoutes.historyDetail,
        name: AppRouteNames.historyDetail,
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return HistoryDetailPage(historyId: id);
        },
      ),

      // ログイン画面
      GoRoute(
        path: AppRoutes.login,
        name: AppRouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),

      // プレミアム画面（モーダル）
      GoRoute(
        path: AppRoutes.premium,
        name: AppRouteNames.premium,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const _PlaceholderPage(title: 'プレミアム'),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            );
          },
        ),
      ),
    ],

    // エラーページ
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'ページが見つかりません',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              state.uri.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('ホームに戻る'),
            ),
          ],
        ),
      ),
    ),
  );
});

/// プレースホルダーページ（実際の画面実装まで使用）
class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              '実装中...',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
