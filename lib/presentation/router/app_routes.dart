/// Yogolyzer のルートパス定義
class AppRoutes {
  AppRoutes._();

  // メイン画面
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';

  // 診断フロー
  static const String camera = '/camera';
  static const String selectLocation = '/select-location';
  static const String selectMaterial = '/select-material';
  static const String diagnosing = '/diagnosing';
  static const String result = '/result/:id';

  // 履歴
  static const String history = '/history';
  static const String historyDetail = '/history/:id';

  // 設定・認証
  static const String settings = '/settings';
  static const String login = '/login';
  static const String premium = '/premium';

  /// 診断結果画面のパスを生成
  static String resultPath(String id) => '/result/$id';

  /// 履歴詳細画面のパスを生成
  static String historyDetailPath(String id) => '/history/$id';
}

/// ルート名定義
class AppRouteNames {
  AppRouteNames._();

  static const String splash = 'splash';
  static const String onboarding = 'onboarding';
  static const String home = 'home';
  static const String camera = 'camera';
  static const String selectLocation = 'selectLocation';
  static const String selectMaterial = 'selectMaterial';
  static const String diagnosing = 'diagnosing';
  static const String result = 'result';
  static const String history = 'history';
  static const String historyDetail = 'historyDetail';
  static const String settings = 'settings';
  static const String login = 'login';
  static const String premium = 'premium';
}
