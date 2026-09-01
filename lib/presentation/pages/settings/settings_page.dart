import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../router/app_routes.dart';
import '../../view_models/settings/settings_view_model.dart';

/// 設定画面
class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsViewModelProvider);
    final viewModel = ref.read(settingsViewModelProvider.notifier);

    useEffect(() {
      Future.microtask(() {
        viewModel.loadSettings();
      });
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
        automaticallyImplyLeading: false,
      ),
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        loaded: (userInfo, isPremium, isSyncEnabled, appVersion) =>
            _buildContent(
          context,
          ref,
          userInfo: userInfo,
          isPremium: isPremium,
          isSyncEnabled: isSyncEnabled,
          appVersion: appVersion,
        ),
        error: (message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 48,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => viewModel.loadSettings(),
                child: const Text('再読み込み'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref, {
    required UserInfo? userInfo,
    required bool isPremium,
    required bool isSyncEnabled,
    required String appVersion,
  }) {
    final viewModel = ref.read(settingsViewModelProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      children: [
        // アカウントセクション
        _buildSectionHeader(context, 'アカウント'),
        _buildListTile(
          context,
          icon: Icons.person_outline,
          title: 'ログイン状態',
          trailing: Text(
            userInfo != null ? userInfo.email : '未ログイン',
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          onTap: () {
            if (userInfo == null) {
              context.push(AppRoutes.login);
            } else {
              _showAccountDialog(context, ref, userInfo);
            }
          },
        ),
        if (userInfo != null)
          _buildSwitchTile(
            context,
            icon: Icons.sync,
            title: 'データ同期',
            subtitle: 'クラウドにデータをバックアップ',
            value: isSyncEnabled,
            onChanged: (value) async {
              await viewModel.toggleSync();
            },
          ),

        const Divider(),

        // プレミアムセクション
        _buildSectionHeader(context, 'プレミアム'),
        _buildListTile(
          context,
          icon: Icons.workspace_premium,
          iconColor: isPremium ? Colors.amber : null,
          title: isPremium ? 'プレミアム会員' : 'プレミアムに登録',
          trailing: isPremium
              ? const Icon(Icons.check_circle, color: Colors.green)
              : const Icon(Icons.chevron_right),
          onTap: () {
            if (!isPremium) {
              context.push(AppRoutes.premium);
            }
          },
        ),

        const Divider(),

        // アプリ情報セクション
        _buildSectionHeader(context, 'アプリ情報'),
        _buildListTile(
          context,
          icon: Icons.help_outline,
          title: '使い方',
          trailing: const Icon(Icons.chevron_right),
          onTap: () => _showHowToUseDialog(context),
        ),
        _buildListTile(
          context,
          icon: Icons.quiz_outlined,
          title: 'よくある質問',
          trailing: const Icon(Icons.chevron_right),
          onTap: () => _showFaqDialog(context),
        ),
        _buildListTile(
          context,
          icon: Icons.mail_outline,
          title: 'お問い合わせ',
          trailing: const Icon(Icons.open_in_new, size: 18),
          onTap: () => _launchContactUrl(),
        ),
        _buildListTile(
          context,
          icon: Icons.description_outlined,
          title: '利用規約',
          trailing: const Icon(Icons.open_in_new, size: 18),
          onTap: () => _launchTermsUrl(),
        ),
        _buildListTile(
          context,
          icon: Icons.privacy_tip_outlined,
          title: 'プライバシーポリシー',
          trailing: const Icon(Icons.open_in_new, size: 18),
          onTap: () => _launchPrivacyUrl(),
        ),

        const Divider(),

        // バージョン情報
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Text(
            'バージョン $appVersion',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      value: value,
      onChanged: onChanged,
    );
  }

  void _showAccountDialog(
    BuildContext context,
    WidgetRef ref,
    UserInfo userInfo,
  ) {
    final viewModel = ref.read(settingsViewModelProvider.notifier);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('アカウント'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('メールアドレス: ${userInfo.email}'),
            const SizedBox(height: 8),
            Text('認証方法: ${_getProviderName(userInfo.provider)}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('閉じる'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final confirmed = await _showLogoutConfirmDialog(context);
              if (confirmed == true) {
                final success = await viewModel.logout();
                if (context.mounted && success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('ログアウトしました')),
                  );
                }
              }
            },
            child: const Text('ログアウト'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final confirmed = await _showDeleteAccountConfirmDialog(context);
              if (confirmed == true) {
                final success = await viewModel.deleteAccount();
                if (context.mounted && success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('アカウントを削除しました')),
                  );
                }
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('アカウント削除'),
          ),
        ],
      ),
    );
  }

  String _getProviderName(String provider) {
    switch (provider) {
      case 'apple':
        return 'Apple';
      case 'google':
        return 'Google';
      default:
        return provider;
    }
  }

  Future<bool?> _showLogoutConfirmDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ログアウト'),
        content: const Text('ログアウトしますか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('ログアウト'),
          ),
        ],
      ),
    );
  }

  Future<bool?> _showDeleteAccountConfirmDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('アカウント削除'),
        content: const Text(
          'アカウントを削除すると、すべてのデータが失われます。\n'
          'この操作は取り消せません。\n\n'
          '本当に削除しますか？',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('削除する'),
          ),
        ],
      ),
    );
  }

  void _showHowToUseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('使い方'),
        content: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HowToUseStep(
                number: 1,
                title: '汚れを撮影',
                description: 'ホーム画面の「診断を始める」ボタンをタップして、汚れをカメラで撮影します。',
              ),
              SizedBox(height: 16),
              _HowToUseStep(
                number: 2,
                title: '場所と素材を選択',
                description: '汚れがある場所（キッチン、浴室など）と素材（タイル、壁紙など）を選択します。',
              ),
              SizedBox(height: 16),
              _HowToUseStep(
                number: 3,
                title: 'AI診断',
                description: 'AIが汚れの種類を判定し、最適な洗剤と掃除方法を提案します。',
              ),
              SizedBox(height: 16),
              _HowToUseStep(
                number: 4,
                title: '履歴を確認',
                description: '過去の診断結果は履歴画面でいつでも確認できます。',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('閉じる'),
          ),
        ],
      ),
    );
  }

  void _showFaqDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('よくある質問'),
        content: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FaqItem(
                question: '無料で何回診断できますか？',
                answer: '1日3回まで無料で診断できます。プレミアム会員になると無制限に診断できます。',
              ),
              SizedBox(height: 16),
              _FaqItem(
                question: '診断履歴は保存されますか？',
                answer:
                    '無料会員は端末に5件まで保存されます。プレミアム会員はクラウドに無制限で保存できます。',
              ),
              SizedBox(height: 16),
              _FaqItem(
                question: 'オフラインでも使えますか？',
                answer: '診断にはインターネット接続が必要です。履歴の閲覧はオフラインでも可能です。',
              ),
              SizedBox(height: 16),
              _FaqItem(
                question: 'プレミアムを解約するには？',
                answer: 'App Storeのサブスクリプション管理画面から解約できます。',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('閉じる'),
          ),
        ],
      ),
    );
  }

  Future<void> _launchContactUrl() async {
    final uri = Uri.parse('mailto:support@yogolyzer.example.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _launchTermsUrl() async {
    final uri = Uri.parse('https://yogolyzer.example.com/terms');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchPrivacyUrl() async {
    final uri = Uri.parse('https://yogolyzer.example.com/privacy');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

/// 使い方のステップ
class _HowToUseStep extends StatelessWidget {
  const _HowToUseStep({
    required this.number,
    required this.title,
    required this.description,
  });

  final int number;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// FAQアイテム
class _FaqItem extends StatelessWidget {
  const _FaqItem({
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q. ',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Expanded(
              child: Text(
                question,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            answer,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
