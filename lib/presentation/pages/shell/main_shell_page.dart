import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/app_routes.dart';
import '../../widgets/app_bottom_navigation.dart';

/// メインシェルページ（BottomNavigation付き）
class MainShellPage extends StatelessWidget {
  const MainShellPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNavigation(
        currentTab: _getCurrentTab(context),
        onTabSelected: (tab) => _onTabSelected(context, tab),
      ),
    );
  }

  /// 現在のパスからタブを判定
  AppBottomNavTab _getCurrentTab(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    if (location.startsWith('/history')) {
      return AppBottomNavTab.history;
    } else if (location.startsWith('/settings')) {
      return AppBottomNavTab.settings;
    } else {
      return AppBottomNavTab.home;
    }
  }

  /// タブ選択時の処理
  void _onTabSelected(BuildContext context, AppBottomNavTab tab) {
    switch (tab) {
      case AppBottomNavTab.home:
        context.go(AppRoutes.home);
      case AppBottomNavTab.history:
        context.go(AppRoutes.history);
      case AppBottomNavTab.settings:
        context.go(AppRoutes.settings);
    }
  }
}
