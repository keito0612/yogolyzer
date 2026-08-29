import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_shadows.dart';

/// ボトムナビゲーションのタブ
enum AppBottomNavTab {
  home,
  history,
  settings,
}

/// Yogolyzer のボトムナビゲーションウィジェット
class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  /// 現在選択されているタブ
  final AppBottomNavTab currentTab;

  /// タブ選択時のコールバック
  final ValueChanged<AppBottomNavTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: AppShadows.bottomNav,
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                tab: AppBottomNavTab.home,
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: 'ホーム',
              ),
              _buildNavItem(
                tab: AppBottomNavTab.history,
                icon: Icons.history_outlined,
                activeIcon: Icons.history,
                label: '履歴',
              ),
              _buildNavItem(
                tab: AppBottomNavTab.settings,
                icon: Icons.settings_outlined,
                activeIcon: Icons.settings,
                label: '設定',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required AppBottomNavTab tab,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final isSelected = currentTab == tab;

    return Expanded(
      child: InkWell(
        onTap: () => onTabSelected(tab),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              size: 24,
              color: isSelected ? AppColors.navActive : AppColors.navInactive,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                color: isSelected ? AppColors.navActive : AppColors.navInactive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
