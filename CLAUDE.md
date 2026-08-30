# Yogolyzer - 汚れ診断AIアプリ

## 概要

| 項目 | 内容 |
|------|------|
| アプリ名 | Yogolyzer |
| コンセプト | 汚れを撮影→AI診断→洗剤・掃除方法を提案 |
| ターゲット | 掃除に悩む一般家庭ユーザー |
| 収益モデル | サブスクリプション |
| 対応プラットフォーム | iOS（後にAndroid対応予定） |

## 背景・課題

### 解決したい課題

家の掃除で直面する問題：

1. **汚れの種類がわからない**
   - 油汚れ？カビ？水垢？
   - 何が原因でこうなった？

2. **適切な洗剤がわからない**
   - どの洗剤を使えばいい？
   - 素材を傷めない？

3. **市販洗剤で落ちない**
   - 頑固な汚れにどう対処する？
   - 専用の洗剤を自作できる？

### Yogolyzerの解決策

```
1. 汚れを撮影
   → カメラで壁や床の汚れを撮る

2. 場所・素材を選択
   → タップで簡単に選択（その他は入力）

3. AI診断
   → 汚れの種類を判定

4. 洗剤提案（2段階）
   → まず市販洗剤を提案
   → 落ちない場合は自作洗剤レシピを提案
```

## 機能一覧

### コア機能

| # | 機能 | 説明 | データ |
|---|------|------|--------|
| 1 | 汚れ撮影 | カメラで汚れを撮影 | - |
| 2 | 場所選択 | キッチン/浴室/トイレ等を選択 | 埋め込み |
| 3 | 素材選択 | タイル/塗装壁/壁紙等を選択 | 埋め込み |
| 4 | AI診断 | 汚れの種類を判定 | API経由 |
| 5 | 洗剤提案 | 市販洗剤をおすすめ | 埋め込み |
| 6 | 自作レシピ | 調合レシピを提案 | 埋め込み |
| 7 | 掃除ガイド | ステップバイステップの手順 | AI生成 |

### 履歴・データ管理

| # | 機能 | 説明 | データ |
|---|------|------|--------|
| 8 | 診断履歴 | 過去の診断結果を保存 | ローカルSQLite |
| 9 | 履歴削除 | 診断履歴を削除 | ローカルSQLite |
| 10 | バックアップ | データをクラウドに保存 | API経由→R2 |
| 11 | リストア | クラウドからデータ復元 | API経由←R2 |

### 認証・課金

| # | 機能 | 説明 | データ |
|---|------|------|--------|
| 12 | Appleログイン | Apple IDで認証 | API経由 |
| 13 | Googleログイン | Googleアカウントで認証 | API経由 |
| 14 | ログアウト | セッション終了 | API経由 |
| 15 | サブスク購入 | プレミアム購入 | RevenueCat |
| 16 | サブスク復元 | 購入復元 | RevenueCat |

### 設定

| # | 機能 | 説明 | データ |
|---|------|------|--------|
| 17 | アカウント削除 | アカウント完全削除 | API経由 |
| 18 | 使い方 | アプリの使い方表示 | 埋め込み |
| 19 | お問い合わせ | サポート連絡 | 外部リンク |

### 機能数まとめ

| カテゴリ | 機能数 |
|---------|:------:|
| コア機能 | 7 |
| 履歴・データ管理 | 4 |
| 認証・課金 | 5 |
| 設定 | 3 |
| **合計** | **19** |

## 入力フロー

```
┌─────────────────────────────────────┐
│ 1. 写真を撮る                       │
└─────────────────────────────────────┘
            ↓
┌─────────────────────────────────────┐
│ 2. 場所を選択                       │
│                                     │
│  [キッチン] [浴室] [トイレ]         │
│  [リビング] [寝室] [玄関]           │
│  [ベランダ] [その他 ✏️]             │
└─────────────────────────────────────┘
            ↓
┌─────────────────────────────────────┐
│ 3. 素材を選択（場所に応じて変わる） │
│                                     │
│  例: キッチンを選んだ場合           │
│  [タイル] [塗装壁] [壁紙]           │
│  [ステンレス] [その他 ✏️]           │
└─────────────────────────────────────┘
            ↓
┌─────────────────────────────────────┐
│ 4. AI診断 → 結果表示               │
└─────────────────────────────────────┘
```

## 場所×素材の選択肢マッピング

| 場所 | 素材の選択肢 |
|------|-------------|
| キッチン | タイル / 塗装壁 / 壁紙 / ステンレス / 人工大理石 |
| 浴室 | タイル / 樹脂パネル / ゴムパッキン / 鏡 / ステンレス |
| トイレ | タイル / 壁紙 / 塗装壁 / 便器（陶器） |
| リビング | 壁紙 / 塗装壁 / フローリング / カーペット |
| 寝室 | 壁紙 / 塗装壁 / フローリング / カーペット |
| 玄関 | タイル / コンクリート / 塗装壁 |
| ベランダ | コンクリート / タイル / 樹脂 |

## 洗剤提案の流れ

```
┌─────────────────────────────────────┐
│ Step 1: 市販洗剤で試す              │
│                                     │
│ 例: 油汚れ + カビ（塗装壁）         │
│ → 「カビキラー」でカビ除去          │
│ → 「マジックリン」で油汚れ除去      │
│                                     │
│ ⚠️ 注意: 塗装壁は色落ちの可能性あり │
│ → 目立たない場所でテスト推奨        │
└─────────────────────────────────────┘
            ↓ 落ちない場合
┌─────────────────────────────────────┐
│ Step 2: 自作洗剤レシピ              │
│                                     │
│ 【油汚れ + カビ用】                 │
│ ━━━━━━━━━━━━━━━━━━━━━             │
│ 材料:                               │
│ ・重曹 大さじ2                      │
│ ・水 200ml                          │
│ ・食器用洗剤 数滴                   │
│                                     │
│ 作り方:                             │
│ 1. 重曹を水に溶かす                 │
│ 2. 食器用洗剤を加えて混ぜる         │
│ 3. スプレーボトルに入れる           │
│                                     │
│ 使い方:                             │
│ 1. 汚れに吹きかけて5分放置          │
│ 2. 柔らかい布で拭き取る             │
│ 3. 水拭きで仕上げ                   │
└─────────────────────────────────────┘
```

## 技術スタック

### フロントエンド

| 項目 | 技術 |
|------|------|
| フレームワーク | Flutter |
| 状態管理 | Riverpod |
| ローカルDB | drift (SQLite) |
| サブスク管理 | RevenueCat (purchases_flutter) |
| カメラ | camera |
| ナビゲーション | go_router |
| テスト | flutter_test (unit/widget), integration_test, mockito |

### バックエンド

| 項目 | 技術 |
|------|------|
| フレームワーク | Hono |
| 言語 | TypeScript |
| ランタイム | Cloudflare Workers |
| 認証 | Better Auth |
| ORM | Prisma |
| DB | Turso |
| ストレージ | Cloudflare R2 |
| テスト | Vitest |

### AI

| 項目 | 技術 |
|------|------|
| API | Google Gemini 1.5 Flash |
| 理由 | 画像対応モデルで最安（入力 $0.075/1M, 出力 $0.30/1M） |

### CI/CD

| 項目 | 技術 |
|------|------|
| CI/CD | GitHub Actions |
| iOS配信 | Fastlane |

## アーキテクチャ

### 全体構成

```
┌─────────────────────────────────────┐
│            フロントエンド            │
│  Flutter (iOS → Android)            │
│  状態管理: Riverpod                 │
│  サブスク: RevenueCat               │
└─────────────────────────────────────┘
                 ↓ API
┌─────────────────────────────────────┐
│            バックエンド              │
│  Hono (TypeScript)                  │
│  ホスティング: Cloudflare Workers   │
│  DB: Turso          │
│  認証: Better Auth                  │
└─────────────────────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│              外部API                │
│  Google Gemini 1.5 Flash            │
└─────────────────────────────────────┘
```

### バックエンドが必要な理由

| 理由 | 説明 |
|------|------|
| APIキー保護 | AI APIキーをアプリに埋め込むと漏洩リスク。サーバー経由で呼ぶ |
| サブスク検証 | App Storeのレシート検証をサーバーで行う |
| 履歴保存 | 診断履歴をクラウドに保存（機種変更対応） |
| 洗剤DB更新 | 新しい洗剤情報をアプリ更新なしで追加 |

### レイヤードアーキテクチャ（クリーンアーキテクチャ）

フロントエンド・バックエンド共通の設計方針。

```
┌─────────────────────────────────────────────────┐
│              Presentation層                      │
│      View (Screen) + ViewModel (Store)          │
│      UI表示・ユーザー操作・状態管理              │
└─────────────────────────────────────────────────┘
                      ↓↑
┌─────────────────────────────────────────────────┐
│              Application層                       │
│              UseCase / Service                   │
│         アプリ固有のビジネスロジック             │
│    例: DiagnoseStainUseCase, SyncHistoryUseCase │
└─────────────────────────────────────────────────┘
                      ↓↑
┌─────────────────────────────────────────────────┐
│                Domain層                          │
│           Entity + Repository(interface)         │
│         ビジネスルール・型定義                   │
│    例: Diagnosis, Detergent, IDiagnosisRepo     │
└─────────────────────────────────────────────────┘
                      ↓↑
┌─────────────────────────────────────────────────┐
│            Infrastructure層                      │
│      Repository実装 + DataSource                │
│         DB・API・外部サービス接続               │
│    例: DiagnosisRepoImpl, ApiClient, SQLite     │
└─────────────────────────────────────────────────┘
```

### 各層の責務

| 層 | 責務 | 含まれるもの |
|----|------|-------------|
| **Presentation** | UI表示・状態管理 | Page, Widget, Provider (Riverpod),flutter_hooks |
| **Application** | ユースケース実行 | UseCase |
| **Domain** | ビジネスルール | Entity, Repository Interface, Value Object |
| **Infrastructure** | 外部接続 | Repository実装, API Client, drift, 外部SDK |

### MVVM パターン（Presentation層の詳細）

Presentation層はMVVMパターンで構成する。**ViewにロジックやAPIコールを書かない**。

```
┌─────────────────────────────────────────────────┐
│                    View                          │
│        (StatelessWidget / ConsumerWidget)        │
│                                                  │
│  責務:                                           │
│  - UIの描画のみ                                  │
│  - ref.watch() で状態を監視                      │
│  - ref.listen() で状態変化時のアクション         │
│  - ユーザー操作を ViewModel に委譲               │
│                                                  │
│  禁止:                                           │
│  - ビジネスロジック                              │
│  - API呼び出し                                   │
│  - SharedPreferences等の直接アクセス             │
└─────────────────────────────────────────────────┘
                      ↓↑ ref.watch / ref.read
┌─────────────────────────────────────────────────┐
│                 ViewModel                        │
│           (Riverpod Notifier)                    │
│                                                  │
│  責務:                                           │
│  - 画面の状態管理 (state)                        │
│  - ユーザー操作のハンドリング                    │
│  - UseCase / Repository の呼び出し               │
│  - 状態遷移ロジック                              │
│                                                  │
│  実装:                                           │
│  - class XxxViewModel extends Notifier<XxxState> │
│  - final xxxViewModelProvider = NotifierProvider │
└─────────────────────────────────────────────────┘
                      ↓↑
┌─────────────────────────────────────────────────┐
│          UseCase / Repository / Service          │
└─────────────────────────────────────────────────┘
```

#### 実装例

```dart
// ═══════════════════════════════════════════════
// 1. State（sealed classで定義）
// ═══════════════════════════════════════════════
sealed class SplashState {
  const SplashState();

  /// パターンマッチング用
  T when<T>({
    required T Function() loading,
    required T Function() navigateToOnboarding,
    required T Function() navigateToHome,
  }) {
    return switch (this) {
      SplashStateLoading() => loading(),
      SplashStateNavigateToOnboarding() => navigateToOnboarding(),
      SplashStateNavigateToHome() => navigateToHome(),
    };
  }
}

final class SplashStateLoading extends SplashState {
  const SplashStateLoading();
}

final class SplashStateNavigateToOnboarding extends SplashState {
  const SplashStateNavigateToOnboarding();
}

final class SplashStateNavigateToHome extends SplashState {
  const SplashStateNavigateToHome();
}

// ═══════════════════════════════════════════════
// 2. ViewModel（ロジック）
// ═══════════════════════════════════════════════
class SplashViewModel extends Notifier<SplashState> {
  @override
  SplashState build() => const SplashStateLoading();

  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final hasCompleted = prefs.getBool('hasCompletedOnboarding') ?? false;

    state = hasCompleted
        ? const SplashStateNavigateToHome()
        : const SplashStateNavigateToOnboarding();
  }
}

final splashViewModelProvider =
    NotifierProvider.autoDispose<SplashViewModel, SplashState>(
      SplashViewModel.new,
    );

// ═══════════════════════════════════════════════
// 3. View（UIのみ）
// ═══════════════════════════════════════════════
class SplashPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    // ViewModelの初期化を呼び出すだけ
    Future.microtask(() {
      ref.read(splashViewModelProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    // 状態変化を監視してナビゲーション（whenでパターンマッチ）
    ref.listen<SplashState>(splashViewModelProvider, (_, next) {
      next.when(
        loading: () {},
        navigateToOnboarding: () => context.go('/onboarding'),
        navigateToHome: () => context.go('/home'),
      );
    });

    // UIの描画のみ（ロジックなし）
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
```

#### なぜ sealed class を使うのか

| enum | sealed class |
|------|--------------|
| データを持てない | 各状態にデータを持てる（例: `Error(String message)`） |
| パターンマッチが限定的 | `when` / `maybeWhen` でパターンマッチ |
| 拡張が難しい | 新しい状態を追加しやすい |

```dart
// sealed class なら状態にデータを持てる
sealed class DiagnosisState {
  const DiagnosisState();
}
final class DiagnosisLoading extends DiagnosisState { ... }
final class DiagnosisSuccess extends DiagnosisState {
  final Diagnosis result;  // データを保持
  const DiagnosisSuccess(this.result);
}
final class DiagnosisError extends DiagnosisState {
  final String message;    // エラーメッセージを保持
  const DiagnosisError(this.message);
}
```

#### ファイル構成

```
lib/presentation/pages/splash/
├── splash_page.dart           # View（UI）
└── splash_view_model.dart     # ViewModel（状態・ロジック）
```

#### よくある間違い

| ❌ NG | ✅ OK |
|-------|-------|
| Viewで直接 `SharedPreferences.getInstance()` | ViewModelで `SharedPreferences` を使う |
| Viewで直接 `context.go()` の条件分岐 | ViewModelで状態を変え、Viewは `ref.listen` で反応 |
| Viewに `if (isFirstTime) ...` のロジック | ViewModelに状態遷移ロジックを置く |
| StatefulWidgetで `setState()` で状態管理 | Riverpod Notifier で `state = ...` |

### フォルダ構成（Flutter）

```
lib/
├── main.dart                   # エントリーポイント
├── app.dart                    # アプリ設定・ルーティング
│
├── presentation/               # Presentation層
│   ├── pages/                  # 画面
│   │   ├── home/
│   │   │   ├── home_page.dart
│   │   │   └── home_view_model.dart
│   │   ├── camera/
│   │   │   ├── camera_page.dart
│   │   │   └── camera_view_model.dart
│   │   ├── select_location/
│   │   ├── select_material/
│   │   ├── diagnosis_result/
│   │   ├── history/
│   │   └── settings/
│   ├── widgets/                # 共通ウィジェット
│   │   ├── app_button.dart
│   │   ├── app_card.dart
│   │   └── selection_chip.dart
│   └── providers/              # Riverpod providers (ViewModel)
│       ├── diagnosis_provider.dart
│       ├── user_provider.dart
│       └── subscription_provider.dart
│
├── application/                # Application層
│   └── usecases/
│       ├── diagnose_stain_usecase.dart
│       ├── sync_history_usecase.dart
│       ├── get_detergents_usecase.dart
│       └── authenticate_usecase.dart
│
├── domain/                     # Domain層
│   ├── entities/
│   │   ├── diagnosis.dart
│   │   ├── detergent.dart
│   │   ├── recipe.dart
│   │   └── user.dart
│   └── repositories/           # インターフェース
│       ├── i_diagnosis_repository.dart
│       ├── i_detergent_repository.dart
│       └── i_user_repository.dart
│
├── infrastructure/             # Infrastructure層
│   ├── repositories/           # 実装
│   │   ├── diagnosis_repository_impl.dart
│   │   ├── detergent_repository_impl.dart
│   │   └── user_repository_impl.dart
│   ├── datasources/
│   │   ├── local/              # drift (SQLite)
│   │   │   ├── database.dart
│   │   │   ├── database.g.dart
│   │   │   └── tables/
│   │   └── remote/             # API
│   │       └── api_client.dart
│   └── external/               # 外部SDK
│       ├── revenue_cat_service.dart
│       └── camera_service.dart
│
└── shared/                     # 共通
    ├── constants/
    ├── extensions/
    └── utils/

test/                           # テスト
├── unit/                       # ユニットテスト
│   ├── usecases/
│   ├── repositories/
│   └── entities/
├── widget/                     # ウィジェットテスト
│   ├── pages/
│   └── widgets/
├── integration/                # 統合テスト
└── mocks/                      # モック
```

### テストパターン

**AAAパターン（Arrange-Act-Assert）** を採用。

```dart
test('診断結果が正しく取得できること', () {
  // Arrange（準備）
  final repository = MockDiagnosisRepository();
  final usecase = DiagnoseStainUseCase(repository);
  when(repository.analyze(any)).thenAnswer((_) async => mockDiagnosis);

  // Act（実行）
  final result = await usecase.execute(image, location, material);

  // Assert（検証）
  expect(result.stainType, equals('油汚れ'));
  verify(repository.analyze(any)).called(1);
});
```

| フェーズ | 内容 |
|---------|------|
| **Arrange** | テストデータ・モック・対象クラスの準備 |
| **Act** | テスト対象のメソッドを実行 |
| **Assert** | 結果の検証 |

### フォルダ構成（バックエンド）

```
src/
├── index.ts                    # エントリーポイント
├── app.ts                      # Honoアプリ設定
│
├── presentation/               # Presentation層
│   ├── routes/                 # ルート定義
│   │   ├── auth.ts
│   │   ├── diagnosis.ts
│   │   ├── detergents.ts
│   │   └── subscription.ts
│   ├── controllers/            # コントローラー
│   │   ├── AuthController.ts
│   │   ├── DiagnosisController.ts
│   │   ├── DetergentsController.ts
│   │   └── SubscriptionController.ts
│   └── middlewares/
│       ├── authMiddleware.ts
│       └── rateLimitMiddleware.ts
│
├── application/                # Application層
│   └── usecases/
│       ├── AnalyzeStainUseCase.ts
│       ├── SyncHistoryUseCase.ts
│       ├── VerifySubscriptionUseCase.ts
│       └── GetDetergentsUseCase.ts
│
├── domain/                     # Domain層
│   ├── entities/
│   │   ├── Diagnosis.ts
│   │   ├── Detergent.ts
│   │   ├── Recipe.ts
│   │   └── User.ts
│   └── repositories/           # インターフェース
│       ├── IDiagnosisRepository.ts
│       ├── IDetergentRepository.ts
│       └── IUserRepository.ts
│
├── infrastructure/             # Infrastructure層
│   ├── repositories/           # 実装
│   │   ├── DiagnosisRepositoryImpl.ts
│   │   ├── DetergentRepositoryImpl.ts
│   │   └── UserRepositoryImpl.ts
│   ├── datasources/
│   │   ├── prisma/             # Prisma設定
│   │   │   └── schema.prisma
│   │   └── turso/
│   │       └── client.ts
│   └── external/               # 外部API
│       ├── geminiClient.ts
│       └── r2Client.ts
│
└── shared/                     # 共通
    ├── types/
    └── utils/
```

## 画面一覧

| # | 画面名 | パス | 説明 | 認証 |
|---|--------|------|------|:----:|
| 1 | スプラッシュ | `/` | 起動画面、初期化処理 | - |
| 2 | オンボーディング | `/onboarding` | 初回起動時の説明（3枚） | - |
| 3 | ホーム | `/home` | メイン画面、診断開始ボタン | - |
| 4 | カメラ | `/camera` | 汚れを撮影 | - |
| 5 | 場所選択 | `/select-location` | 場所をタップで選択 | - |
| 6 | 素材選択 | `/select-material` | 素材をタップで選択 | - |
| 7 | 診断中 | `/diagnosing` | ローディング画面 | - |
| 8 | 診断結果 | `/result/:id` | AI診断結果・洗剤提案 | - |
| 9 | 履歴一覧 | `/history` | 過去の診断履歴 | - |
| 10 | 履歴詳細 | `/history/:id` | 過去の診断詳細 | - |
| 11 | 設定 | `/settings` | 各種設定 | - |
| 12 | ログイン | `/login` | Apple/Google認証 | - |
| 13 | プレミアム | `/premium` | サブスク購入画面 | - |

### 画面遷移図

```
スプラッシュ
    ↓
オンボーディング（初回のみ）
    ↓
┌─────────────────────────────────────────────────┐
│                    ホーム                        │
│                      ↓                          │
│              [診断を始める]                      │
│                      ↓                          │
│    カメラ → 場所選択 → 素材選択 → 診断中 → 結果  │
└─────────────────────────────────────────────────┘
        ↓                   ↓                ↓
     履歴一覧             設定           プレミアム
        ↓                   ↓
     履歴詳細            ログイン
```

### 画面詳細

#### ホーム画面

```
┌─────────────────────────┐
│ Yogolyzer        [履歴] │
├─────────────────────────┤
│                         │
│    [汚れの画像/空]       │
│                         │
│   汚れを撮影して         │
│   最適な掃除方法を       │
│   見つけましょう         │
│                         │
│   [ 📷 診断を始める ]    │
│                         │
│ 今日の診断: 1/3回        │
│                         │
├─────────────────────────┤
│ [🏠]    [📋]    [⚙️]    │
│ ホーム  履歴    設定     │
└─────────────────────────┘
```

#### 診断結果画面

```
┌─────────────────────────┐
│ ← 診断結果              │
├─────────────────────────┤
│ [撮影した汚れ画像]       │
│                         │
│ 📍 キッチン / タイル     │
│                         │
│ 🔍 診断結果              │
│ ┌─────────────────────┐ │
│ │ 油汚れ + カビ        │ │
│ │ 信頼度: 85%          │ │
│ └─────────────────────┘ │
│                         │
│ 🧴 おすすめ洗剤         │
│ ┌─────────────────────┐ │
│ │ 1. カビキラー        │ │
│ │ 2. マジックリン      │ │
│ └─────────────────────┘ │
│                         │
│ 🧪 自作レシピ           │
│ ┌─────────────────────┐ │
│ │ 重曹スプレー         │ │
│ │ [詳しく見る →]      │ │
│ └─────────────────────┘ │
│                         │
│ 📝 掃除手順             │
│ 1. カビキラーを吹きかけ │
│ 2. 5分放置             │
│ 3. 水拭きで仕上げ      │
│                         │
│ ⚠️ 注意                 │
│ ・換気をしてください    │
│                         │
│ [ 履歴に保存 ]          │
└─────────────────────────┘
```

#### 設定画面

```
┌─────────────────────────┐
│ 設定                    │
├─────────────────────────┤
│                         │
│ アカウント              │
│ ├─ ログイン状態    未 > │
│ └─ データ同期       - > │
│                         │
│ プレミアム 👑            │
│ └─ プレミアムに登録   > │
│                         │
│ アプリ情報              │
│ ├─ 使い方            > │
│ ├─ よくある質問      > │
│ ├─ お問い合わせ      > │
│ └─ 利用規約          > │
│                         │
│ バージョン 1.0.0        │
│                         │
└─────────────────────────┘
```

## データ構造

### フロントエンド（ローカルSQLite）

端末内に保存するデータ。オフラインでも参照可能。

#### local_diagnosis_history（診断履歴）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | TEXT (UUID) | PK |
| cloud_id | TEXT | クラウド同期後のID（NULL可） |
| image_path | TEXT | ローカル画像パス |
| location | TEXT | 場所 |
| material | TEXT | 素材 |
| stain_type | TEXT | 汚れの種類 |
| diagnosis_result | TEXT | 診断結果（JSON） |
| is_synced | BOOLEAN | クラウド同期済みか |
| created_at | TIMESTAMP | 診断日時 |

#### local_settings（ユーザー設定）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | INTEGER | PK (1固定) |
| device_id | TEXT | デバイスID |
| is_logged_in | BOOLEAN | ログイン状態 |
| user_id | TEXT | ユーザーID（NULL可） |
| is_premium | BOOLEAN | プレミアム会員か |
| daily_diagnosis_count | INTEGER | 今日の診断回数 |
| last_diagnosis_date | DATE | 最後に診断した日 |

#### cached_detergents（洗剤キャッシュ）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | TEXT (UUID) | PK |
| name | TEXT | 商品名 |
| brand | TEXT | ブランド名 |
| type | TEXT | 種類 |
| data | TEXT | 全データ（JSON） |
| cached_at | TIMESTAMP | キャッシュ日時 |

#### cached_recipes（レシピキャッシュ）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | TEXT (UUID) | PK |
| name | TEXT | レシピ名 |
| data | TEXT | 全データ（JSON） |
| is_premium | BOOLEAN | プレミアム限定か |
| cached_at | TIMESTAMP | キャッシュ日時 |

---

### バックエンド（Turso）

クラウドに保存するデータ。

#### users（ユーザー）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | TEXT (UUID) | PK |
| email | TEXT | メールアドレス |
| provider | TEXT | 認証プロバイダ（apple/google） |
| provider_id | TEXT | プロバイダ側ID |
| is_premium | BOOLEAN | プレミアム会員か |
| premium_expires_at | TIMESTAMP | プレミアム期限 |
| created_at | TIMESTAMP | 作成日時 |
| updated_at | TIMESTAMP | 更新日時 |

#### diagnosis_history（診断履歴）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | TEXT (UUID) | PK |
| user_id | TEXT | FK → users |
| image_url | TEXT | 画像URL（R2） |
| location | TEXT | 場所 |
| material | TEXT | 素材 |
| stain_type | TEXT | 汚れの種類 |
| diagnosis_result | TEXT | 診断結果（JSON） |
| created_at | TIMESTAMP | 診断日時 |

#### rate_limits（レート制限）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | TEXT (UUID) | PK |
| device_id | TEXT | デバイスID |
| user_id | TEXT | ユーザーID（NULL可） |
| date | DATE | 日付 |
| count | INTEGER | その日の診断回数 |
| created_at | TIMESTAMP | 作成日時 |
| updated_at | TIMESTAMP | 更新日時 |

---

### マスタデータ（バックエンド）

APIから取得し、フロントでキャッシュするデータ。

#### locations（場所）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | TEXT (UUID) | PK |
| name_ja | TEXT | 名前（日本語） |
| name_en | TEXT | 名前（英語） |
| icon | TEXT | アイコン |

#### materials（素材）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | TEXT (UUID) | PK |
| name_ja | TEXT | 名前（日本語） |
| name_en | TEXT | 名前（英語） |
| location_id | TEXT | FK → locations |
| cautions | TEXT | 注意事項（JSON） |

#### detergents（洗剤）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | TEXT (UUID) | PK |
| name | TEXT | 商品名 |
| brand | TEXT | ブランド名 |
| type | TEXT | 種類（alkaline/acidic/neutral） |
| target_stains | TEXT | 対象汚れ（JSON配列） |
| target_materials | TEXT | 対象素材（JSON配列） |
| cautions | TEXT | 注意事項 |
| purchase_url | TEXT | 購入リンク |

#### diy_recipes（自作洗剤レシピ）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | TEXT (UUID) | PK |
| name | TEXT | レシピ名 |
| target_stain | TEXT | 対象汚れ |
| ingredients | TEXT | 材料（JSON配列） |
| instructions | TEXT | 作り方（JSON配列） |
| usage | TEXT | 使い方 |
| cautions | TEXT | 注意事項 |
| is_premium | BOOLEAN | プレミアム限定か |

## API設計

### 認証要否の凡例

- 🔓 認証不要（デバイスIDでレート制限）
- 🔐 認証必要

### 認証

| メソッド | エンドポイント | 認証 | 説明 |
|---------|---------------|:----:|------|
| POST | `/auth/signin/apple` | 🔓 | Apple Sign-in |
| POST | `/auth/signin/google` | 🔓 | Google Sign-in |
| POST | `/auth/signout` | 🔐 | サインアウト |
| GET | `/auth/me` | 🔐 | 現在のユーザー情報 |
| DELETE | `/auth/account` | 🔐 | アカウント削除 |

### 診断

| メソッド | エンドポイント | 認証 | 説明 |
|---------|---------------|:----:|------|
| POST | `/diagnosis/analyze` | 🔓 | 画像をAI診断（デバイスIDで3回/日制限） |
| GET | `/diagnosis/history` | 🔐 | クラウド診断履歴一覧 |
| GET | `/diagnosis/:id` | 🔐 | 診断詳細 |
| POST | `/diagnosis/sync` | 🔐 | ローカル履歴をクラウドに同期 |
| DELETE | `/diagnosis/:id` | 🔐 | 診断削除 |

#### POST /diagnosis/analyze

```json
// Request: multipart/form-data
// - image: 画像ファイル
// - location: 場所
// - material: 素材
// - device_id: デバイスID（未ログイン時のレート制限用）

// Response
{
  "id": "uuid",
  "stain_type": "油汚れ + カビ",
  "confidence": 0.85,
  "recommended_detergents": [
    {
      "name": "カビキラー",
      "brand": "ジョンソン",
      "reason": "カビ除去に効果的"
    }
  ],
  "diy_recipe": {
    "name": "重曹スプレー",
    "ingredients": ["重曹 大さじ2", "水 200ml"],
    "instructions": ["重曹を水に溶かす", "スプレーボトルに入れる"]
  },
  "cleaning_steps": [
    "まずカビキラーでカビを除去",
    "5分放置後、水拭き",
    "油汚れが残る場合は重曹スプレーを使用"
  ],
  "cautions": [
    "塗装壁は色落ちの可能性あり",
    "目立たない場所でテスト推奨"
  ]
}
```

#### POST /diagnosis/sync

```json
// Request
{
  "diagnoses": [
    {
      "local_id": "uuid",
      "image_base64": "...",
      "location": "キッチン",
      "material": "タイル",
      "stain_type": "油汚れ",
      "diagnosis_result": { ... },
      "created_at": "2026-08-27T10:00:00Z"
    }
  ]
}

// Response
{
  "synced_count": 3,
  "cloud_ids": ["uuid1", "uuid2", "uuid3"]
}
```

### 洗剤

| メソッド | エンドポイント | 認証 | 説明 |
|---------|---------------|:----:|------|
| GET | `/detergents` | 🔓 | 洗剤一覧 |
| GET | `/detergents/:id` | 🔓 | 洗剤詳細 |
| GET | `/recipes` | 🔓 | 自作レシピ一覧（一部のみ） |
| GET | `/recipes/:id` | 🔓 | 自作レシピ詳細 |
| GET | `/recipes/premium` | 🔐 | プレミアム限定レシピ |

### サブスクリプション

| メソッド | エンドポイント | 認証 | 説明 |
|---------|---------------|:----:|------|
| POST | `/subscription/verify` | 🔐 | 購入レシート検証 |
| GET | `/subscription/status` | 🔐 | サブスク状態確認 |

### レート制限

| 対象 | 制限 | 識別方法 |
|------|------|---------|
| 未ログインユーザー | 3回/日 | デバイスID |
| ログインユーザー（無料） | 3回/日 | ユーザーID |
| プレミアムユーザー | 無制限 | ユーザーID |

## 認証方針

**ログインなしでも使える設計**

| 状態 | できること |
|------|-----------|
| **未ログイン** | 診断機能（3回/日）、履歴は端末ローカル保存 |
| **ログイン済** | 履歴クラウド同期、機種変更時のデータ引き継ぎ |
| **プレミアム** | 診断無制限、全機能利用可 |

### ログインが必要になるタイミング

- サブスク購入時
- クラウド同期を有効にする時
- 機種変更でデータ復元する時

### 認証方法

- Apple Sign-in
- Google Sign-in

## 収益プラン

| 機能 | 無料（未ログイン） | 無料（ログイン済） | プレミアム |
|------|:----------------:|:----------------:|:----------:|
| 診断回数 | 3回/日 | 3回/日 | 無制限 |
| 診断履歴 | 端末に5件 | クラウドに5件 | 無制限 |
| 市販洗剤提案 | ◎ | ◎ | ◎ |
| 自作レシピ | 一部のみ | 一部のみ | すべて |
| 広告 | あり | あり | なし |
| データ同期 | - | ◎ | ◎ |

## 競合分析

### 直接競合（AI写真解析型）

| アプリ名 | プラットフォーム | 特徴 |
|---------|---------------|------|
| StainSlayer AI | Android | 写真で汚れ判定、布地タイプ選択 |
| CleanBot AI | iOS | 写真→AI解析→洗浄方法提案 |
| Stain Solver AI | iOS | カメラで汚れと布地を識別 |
| Stain Fix | iOS | 写真から汚れ判定、タイマー付き |

### Yogolyzerの差別化ポイント

1. **壁・床に特化** - 既存アプリは主に衣類向け
2. **日本語対応** - 競合はほぼ英語のみ
3. **自作洗剤レシピ** - 既存アプリにはない機能
4. **日本の製品** - 日本で買える洗剤を提案
5. **素材考慮** - 素材を傷めない洗剤を提案

## 開発フェーズ

### フェーズ1（MVP）

- iOS版リリース
- 基本機能実装（撮影→診断→提案）
- 主要な場所・素材に対応
- サブスク実装

### フェーズ2

- 診断履歴・クラウド同期
- 洗剤データベース拡充
- 自作レシピ拡充

### フェーズ3

- Android版
- 多言語対応（英語）
- AI精度向上
