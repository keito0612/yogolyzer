# Yogolyzer UIデザインスキル

このスキルは、Yogolyzerアプリの画面を作成する際のデザインガイドラインを定義します。
UI/UX Pro Maxスキルのベストプラクティスを統合しています。

---

## 優先度付きルール（10カテゴリ）

UI実装時は以下の優先順位でルールを適用すること。

| 優先度 | カテゴリ | 重要ルール |
|:------:|----------|-----------|
| 1 | アクセシビリティ | コントラスト比4.5:1以上、代替テキスト、キーボード操作対応 |
| 2 | タッチ・インタラクション | 最小タッチサイズ44×44px（iOS）/ 48×48dp（Android） |
| 3 | パフォーマンス | 画像最適化、遅延読み込み、バンドルサイズ最小化 |
| 4 | フォーム | ラベル付きインプット、インライン検証、明確なエラー表示 |
| 5 | ナビゲーション | スムーズスクロール、スティッキーナビ、パンくずリスト |
| 6 | レスポンシブ | モバイルファースト、ビューポート設定 |
| 7 | タイポグラフィ | 行の高さ1.5-1.75、適切な文字サイズスケール |
| 8 | フィードバック | ローディング状態、空の状態、トースト通知 |
| 9 | アニメーション | 過度なモーション回避、prefers-reduced-motion対応 |
| 10 | レイアウト | Z-index管理、コンテンツジャンプ防止 |

---

## 3層デザイントークンシステム

### トークンアーキテクチャ

```
┌─────────────────────────────────────────────────┐
│              Component Layer                     │
│   --button-bg, --card-border, --input-focus     │
│   コンポーネント固有のトークン                    │
└─────────────────────────────────────────────────┘
                      ↑
┌─────────────────────────────────────────────────┐
│              Semantic Layer                      │
│   --color-primary, --color-success, --spacing-md │
│   目的・用途に基づくトークン                      │
└─────────────────────────────────────────────────┘
                      ↑
┌─────────────────────────────────────────────────┐
│              Primitive Layer                     │
│   --blue-600, --gray-100, --space-16            │
│   生の値（色コード、数値）                        │
└─────────────────────────────────────────────────┘
```

### 利点

- テーマ切り替えが容易（ダークモード対応）
- 一貫性のあるデザイン
- デザイン→コードの正確なハンドオフ

---

## デザインシステム

### カラーパレット（3層構造）

```dart
// ═══════════════════════════════════════════════
// Primitive Layer - 生の色値
// ═══════════════════════════════════════════════

// Blue Scale
static const Color blue50 = Color(0xFFE3F2FD);
static const Color blue100 = Color(0xFFBBDEFB);
static const Color blue500 = Color(0xFF2196F3);
static const Color blue600 = Color(0xFF1E88E5);
static const Color blue700 = Color(0xFF1976D2);

// Green Scale
static const Color green50 = Color(0xFFE8F5E9);
static const Color green500 = Color(0xFF4CAF50);
static const Color green600 = Color(0xFF43A047);

// Red Scale
static const Color red50 = Color(0xFFFFEBEE);
static const Color red500 = Color(0xFFF44336);
static const Color red600 = Color(0xFFE53935);

// Yellow/Amber Scale
static const Color amber500 = Color(0xFFFFC107);
static const Color amber600 = Color(0xFFFFB300);

// Gray Scale
static const Color gray50 = Color(0xFFFAFAFA);
static const Color gray100 = Color(0xFFF5F5F5);
static const Color gray200 = Color(0xFFEEEEEE);
static const Color gray300 = Color(0xFFE0E0E0);
static const Color gray500 = Color(0xFF9E9E9E);
static const Color gray700 = Color(0xFF616161);
static const Color gray900 = Color(0xFF212121);

// ═══════════════════════════════════════════════
// Semantic Layer - 用途に基づく色
// ═══════════════════════════════════════════════

// Brand Colors
static const Color primary = blue500;           // メインブランド色
static const Color primaryLight = blue100;      // 薄いバリエーション
static const Color primaryDark = blue700;       // 濃いバリエーション
static const Color secondary = green500;        // セカンダリ色

// Feedback Colors
static const Color success = green500;          // 成功・完了
static const Color warning = amber500;          // 警告
static const Color error = red500;              // エラー・危険
static const Color info = blue500;              // 情報

// Surface Colors
static const Color background = gray100;        // 画面背景
static const Color surface = Color(0xFFFFFFFF); // カード・コンテナ背景
static const Color surfaceVariant = gray50;     // バリエーション

// Text Colors
static const Color textPrimary = gray900;       // メインテキスト
static const Color textSecondary = gray700;     // サブテキスト
static const Color textDisabled = gray500;      // 無効状態

// Border/Divider
static const Color divider = gray300;           // 区切り線
static const Color border = gray200;            // ボーダー

// ═══════════════════════════════════════════════
// Component Layer - コンポーネント固有
// ═══════════════════════════════════════════════

// Button
static const Color buttonPrimaryBg = primary;
static const Color buttonPrimaryFg = Color(0xFFFFFFFF);
static const Color buttonSecondaryBg = surface;
static const Color buttonSecondaryFg = primary;
static const Color buttonDisabledBg = gray200;
static const Color buttonDisabledFg = gray500;

// Input
static const Color inputBg = background;
static const Color inputBorder = divider;
static const Color inputFocusBorder = primary;
static const Color inputErrorBorder = error;

// Card
static const Color cardBg = surface;
static const Color cardBorder = border;

// Chip (Selection)
static const Color chipUnselectedBg = background;
static const Color chipUnselectedBorder = divider;
static const Color chipSelectedBg = primary;
static const Color chipSelectedFg = Color(0xFFFFFFFF);
```

### タイポグラフィ

```dart
// ═══════════════════════════════════════════════
// Typography Scale (Material 3 準拠)
// ═══════════════════════════════════════════════

// Display
static const TextStyle displayLarge = TextStyle(
  fontSize: 57,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.25,
  height: 1.12,
);

// Headline
static const TextStyle headlineLarge = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w400,
  height: 1.25,
);

static const TextStyle headlineMedium = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w400,
  height: 1.29,
);

static const TextStyle headlineSmall = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w400,
  height: 1.33,
);

// Title
static const TextStyle titleLarge = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w500,
  height: 1.27,
);

static const TextStyle titleMedium = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
  height: 1.5,
);

static const TextStyle titleSmall = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.1,
  height: 1.43,
);

// Body
static const TextStyle bodyLarge = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.5,
  height: 1.5,
);

static const TextStyle bodyMedium = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
  height: 1.43,
);

static const TextStyle bodySmall = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.4,
  height: 1.33,
);

// Label
static const TextStyle labelLarge = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.1,
  height: 1.43,
);

static const TextStyle labelMedium = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.5,
  height: 1.33,
);

static const TextStyle labelSmall = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.5,
  height: 1.45,
);

// ═══════════════════════════════════════════════
// Yogolyzer用エイリアス（簡易参照用）
// ═══════════════════════════════════════════════
static const TextStyle h1 = headlineMedium;  // 28px
static const TextStyle h2 = titleLarge;       // 22px
static const TextStyle h3 = titleMedium;      // 16px bold
static const TextStyle button = labelLarge;   // 14px bold
```

### スペーシング（8ptグリッド）

```dart
// ═══════════════════════════════════════════════
// Spacing Scale (8pt grid system)
// ═══════════════════════════════════════════════

static const double space2 = 2;    // 極小
static const double space4 = 4;    // xs
static const double space8 = 8;    // sm
static const double space12 = 12;  // sm-md
static const double space16 = 16;  // md (基準)
static const double space20 = 20;  // md-lg
static const double space24 = 24;  // lg
static const double space32 = 32;  // xl
static const double space40 = 40;  // 2xl
static const double space48 = 48;  // 3xl
static const double space64 = 64;  // 4xl

// Semantic aliases
static const double xs = space4;
static const double sm = space8;
static const double md = space16;
static const double lg = space24;
static const double xl = space32;
static const double xxl = space48;

// Screen Padding
static const EdgeInsets screenPadding = EdgeInsets.all(space16);
static const EdgeInsets screenPaddingHorizontal = EdgeInsets.symmetric(horizontal: space16);

// Card Padding
static const EdgeInsets cardPadding = EdgeInsets.all(space16);
static const EdgeInsets cardPaddingCompact = EdgeInsets.all(space12);
```

### 角丸

```dart
// ═══════════════════════════════════════════════
// Border Radius Scale
// ═══════════════════════════════════════════════

static const double radiusXs = 4;
static const double radiusSm = 8;
static const double radiusMd = 12;
static const double radiusLg = 16;
static const double radiusXl = 24;
static const double radiusFull = 999;

// Component-specific
static const double buttonRadius = radiusMd;      // 12px
static const double cardRadius = radiusMd;        // 12px
static const double inputRadius = radiusMd;       // 12px
static const double chipRadius = radiusSm;        // 8px
static const double modalRadius = radiusLg;       // 16px
static const double bottomSheetRadius = radiusXl; // 24px
```

### シャドウ（Elevation）

```dart
// ═══════════════════════════════════════════════
// Elevation / Shadow Scale
// ═══════════════════════════════════════════════

// Level 1 - カード、リスト項目
static List<BoxShadow> elevation1 = [
  BoxShadow(
    color: Colors.black.withOpacity(0.05),
    blurRadius: 3,
    offset: const Offset(0, 1),
  ),
  BoxShadow(
    color: Colors.black.withOpacity(0.03),
    blurRadius: 2,
    offset: const Offset(0, 1),
  ),
];

// Level 2 - 浮いたカード、ドロップダウン
static List<BoxShadow> elevation2 = [
  BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 8,
    offset: const Offset(0, 2),
  ),
  BoxShadow(
    color: Colors.black.withOpacity(0.04),
    blurRadius: 4,
    offset: const Offset(0, 1),
  ),
];

// Level 3 - モーダル、ボトムシート
static List<BoxShadow> elevation3 = [
  BoxShadow(
    color: Colors.black.withOpacity(0.12),
    blurRadius: 16,
    offset: const Offset(0, 4),
  ),
  BoxShadow(
    color: Colors.black.withOpacity(0.06),
    blurRadius: 6,
    offset: const Offset(0, 2),
  ),
];

// Aliases
static List<BoxShadow> cardShadow = elevation1;
static List<BoxShadow> elevatedShadow = elevation2;
static List<BoxShadow> modalShadow = elevation3;
```

---

## 共通コンポーネント仕様

### AppButton（メインボタン）

```
┌─────────────────────────────────────┐
│           ボタンテキスト              │
└─────────────────────────────────────┘

仕様:
- 高さ: 56px (最小タッチターゲット満たす)
- 角丸: 12px (buttonRadius)
- 背景色: primary (buttonPrimaryBg)
- テキスト: 白、labelLarge (14px/500)
- 横幅: 親要素いっぱい or min-width 88px
- パディング: 横24px、縦16px

状態:
- default: primary背景
- hover/pressed: primaryDark背景 or opacity 0.9
- disabled: buttonDisabledBg + buttonDisabledFg
- loading: CircularProgressIndicator（白、20px）

アクセシビリティ:
- Semantics.button = true
- 明確なラベル必須
```

### AppCard（カード）

```
┌─────────────────────────────────────┐
│ [アイコン] タイトル                  │
│                                     │
│ 内容テキスト                         │
└─────────────────────────────────────┘

仕様:
- 背景: cardBg (白)
- 角丸: 12px (cardRadius)
- パディング: 16px (cardPadding)
- シャドウ: elevation1 (cardShadow)
- ボーダー: オプション (cardBorder 1px)

バリエーション:
- outlined: シャドウなし + ボーダーあり
- elevated: elevation2使用
- filled: background色で塗りつぶし
```

### SelectionChip（選択チップ）

```
┌─────────┐     ┌─────────┐
│  ラベル  │ →  │  ラベル  │
└─────────┘     └─────────┘
 未選択          選択中

仕様:
- 最小サイズ: 80x48px (タッチターゲット)
- 角丸: 8px (chipRadius)
- パディング: 12px 16px

未選択状態:
- 背景: chipUnselectedBg
- ボーダー: chipUnselectedBorder 1px
- テキスト: textSecondary、bodyMedium

選択状態:
- 背景: chipSelectedBg
- ボーダー: なし
- テキスト: chipSelectedFg、bodyMedium fontWeight.w500
- チェックアイコン: オプション
```

### AppTextField（テキスト入力）

```
┌─────────────────────────────────────┐
│ ラベル                              │
│ ┌─────────────────────────────────┐ │
│ │ プレースホルダー                 │ │
│ └─────────────────────────────────┘ │
│ ヘルパーテキスト                     │
└─────────────────────────────────────┘

仕様:
- 入力フィールド高さ: 56px
- 背景: inputBg
- 角丸: 12px (inputRadius)
- パディング: 横16px

状態:
- default: inputBorder 1px
- focus: inputFocusBorder 2px
- error: inputErrorBorder 2px + エラーメッセージ（error色）
- disabled: opacity 0.5

ラベル:
- labelSmall、textSecondary
- 上部に配置 or フローティング
```

### BottomNavigation（ボトムナビ）

```
┌─────────────────────────────────────┐
│ [🏠]        [📋]        [⚙️]        │
│ ホーム       履歴        設定         │
└─────────────────────────────────────┘

仕様:
- 高さ: 80px（SafeArea含む）
- 背景: surface
- 各アイテム最小幅: 80px (タッチターゲット)
- シャドウ: 上方向にelevation1

アクティブ状態:
- アイコン: primary色、24px
- ラベル: primary色、labelSmall

非アクティブ状態:
- アイコン: textSecondary色、24px
- ラベル: textSecondary色、labelSmall
```

---

## 各画面のデザイン仕様

### 1. スプラッシュ画面 `/`

```
┌─────────────────────────────────────┐
│                                     │
│                                     │
│           [アプリロゴ]               │
│           Yogolyzer                 │
│                                     │
│                                     │
│         [ローディング]               │
└─────────────────────────────────────┘

構成:
- 背景: primary または グラデーション (primary → primaryDark)
- ロゴ: 中央配置、白、80x80
- アプリ名: headlineMedium、白
- ローディング: CircularProgressIndicator（白、strokeWidth: 3）
- SafeArea適用
```

### 2. オンボーディング画面 `/onboarding`

```
┌─────────────────────────────────────┐
│                              [スキップ]│
│                                     │
│         [イラスト画像]               │
│                                     │
│     汚れを撮影するだけで             │
│     最適な掃除方法がわかる           │
│                                     │
│           ● ○ ○                    │
│                                     │
│         [  次へ  ]                  │
└─────────────────────────────────────┘

構成:
- スキップボタン: 右上16px、labelLarge、textSecondary
- イラスト: 画面上部 40%、アスペクト比維持
- タイトル: titleLarge、中央揃え
- 説明: bodyMedium、textSecondary、中央揃え、行間1.5
- ページインジケーター: 3つのドット（選択: primary、非選択: gray300）
- 次へボタン: AppButton、画面下部padding 16px
- 最終ページ: 「始める」ボタン
```

### 3. ホーム画面 `/home`

```
┌─────────────────────────────────────┐
│ Yogolyzer                    [履歴] │
├─────────────────────────────────────┤
│                                     │
│      ┌───────────────────┐          │
│      │                   │          │
│      │   [イラスト]       │          │
│      │                   │          │
│      └───────────────────┘          │
│                                     │
│       汚れを撮影して                 │
│       最適な掃除方法を               │
│       見つけましょう                 │
│                                     │
│      [ 📷 診断を始める ]             │
│                                     │
│      今日の診断: 1/3回               │
│                                     │
├─────────────────────────────────────┤
│ [🏠]        [📋]        [⚙️]        │
└─────────────────────────────────────┘

構成:
- AppBar: titleLarge左寄せ、履歴アイコン右24px
- メインイラスト: 160x160、中央、角丸16px
- 説明テキスト: bodyLarge、textSecondary、中央、行間1.6
- 診断ボタン: AppButton、primary、カメラアイコン左8px
- 使用回数: bodySmall、textSecondary、中央
- BottomNavigation
```

### 4. カメラ画面 `/camera`

```
┌─────────────────────────────────────┐
│ ← 汚れを撮影                        │
├─────────────────────────────────────┤
│                                     │
│      ┌───────────────────┐          │
│      │                   │          │
│      │   カメラプレビュー  │          │
│      │                   │          │
│      │   [ガイド枠]      │          │
│      │                   │          │
│      └───────────────────┘          │
│                                     │
│   汚れが枠内に入るように             │
│   撮影してください                   │
│                                     │
│           [ 📷 ]                    │
│                                     │
│  [ギャラリー]        [フラッシュ]    │
│                                     │
└─────────────────────────────────────┘

構成:
- AppBar: 戻るボタン（48x48）、titleMedium
- カメラプレビュー: 画面の60%、角丸16px
- ガイド枠: 角丸点線、白、2pxストローク、内側padding 20px
- ヒントテキスト: bodyMedium、textSecondary
- シャッターボタン: 70x70、円形、白ボーダー3px、内側白60x60
- ギャラリー/フラッシュ: 48x48、アイコンボタン、下部左右padding 24px
```

### 5. 場所選択画面 `/select-location`

```
┌─────────────────────────────────────┐
│ ← 場所を選択                        │
├─────────────────────────────────────┤
│                                     │
│  [撮影画像サムネイル]                │
│                                     │
│  汚れがある場所を選んでください       │
│                                     │
│  ┌─────┐ ┌─────┐ ┌─────┐           │
│  │ 🍳  │ │ 🛁  │ │ 🚽  │           │
│  │キッチン│ │浴室│ │トイレ│           │
│  └─────┘ └─────┘ └─────┘           │
│                                     │
│  ┌─────┐ ┌─────┐ ┌─────┐           │
│  │ 🛋️  │ │ 🛏️  │ │ 🚪  │           │
│  │リビング│ │寝室│ │玄関│            │
│  └─────┘ └─────┘ └─────┘           │
│                                     │
│  ┌─────┐ ┌─────────────┐           │
│  │ 🏠  │ │ ✏️ その他   │           │
│  │ベランダ│ │            │           │
│  └─────┘ └─────────────┘           │
│                                     │
│          [  次へ  ]                 │
│                                     │
└─────────────────────────────────────┘

構成:
- AppBar: 戻るボタン、titleMedium
- 撮影画像: 64x64、角丸8px、左寄せ
- 説明: bodyLarge、textPrimary
- 選択グリッド: 3列、gap 12px、SelectionChip使用
- 各チップ: アイコン24px + ラベルbodySmall、min 100x80
- 「その他」: タップでテキスト入力BottomSheet
- 次へボタン: 選択時のみアクティブ、下部padding 16px
```

### 6. 素材選択画面 `/select-material`

```
┌─────────────────────────────────────┐
│ ← 素材を選択                        │
├─────────────────────────────────────┤
│                                     │
│  [撮影画像サムネイル]                │
│  📍 キッチン                        │
│                                     │
│  素材を選んでください               │
│                                     │
│  ┌─────────┐ ┌─────────┐           │
│  │  タイル  │ │  塗装壁  │           │
│  └─────────┘ └─────────┘           │
│  (素材リストは場所によって変動)      │
│                                     │
│  💡 素材がわからない場合は           │
│     「その他」を選んでください       │
│                                     │
│          [  診断する  ]             │
│                                     │
└─────────────────────────────────────┘

構成:
- 場所選択画面と同様のレイアウト
- 選択した場所: bodySmall + 📍アイコン、textSecondary
- 素材グリッド: 2列、場所に応じて動的変更
- ヒントテキスト: info色、bodySmall、💡アイコン
- 診断ボタン: primary、選択時のみアクティブ
```

### 7. 診断中画面 `/diagnosing`

```
┌─────────────────────────────────────┐
│                                     │
│                                     │
│                                     │
│         [撮影画像]                   │
│                                     │
│         [ローディング]               │
│                                     │
│         AI診断中...                 │
│                                     │
│   汚れの種類を分析しています         │
│                                     │
│                                     │
│                                     │
└─────────────────────────────────────┘

構成:
- フルスクリーン（ナビなし、戻るボタンなし）
- 背景: background
- 画像: 中央上部、角丸12px、150x150
- ローディング: CircularProgressIndicator、primary、30px
- メインテキスト: titleMedium、textPrimary
- サブテキスト: bodyMedium、textSecondary
- 自動遷移（キャンセル不可）
```

### 8. 診断結果画面 `/result/:id`

```
┌─────────────────────────────────────┐
│ ← 診断結果                     [保存]│
├─────────────────────────────────────┤
│ ┌─────────────────────────────────┐ │
│ │       [撮影した汚れ画像]         │ │
│ └─────────────────────────────────┘ │
│                                     │
│ 📍 キッチン / タイル                │
│                                     │
│ ┌─────────────────────────────────┐ │
│ │ 🔍 診断結果                      │ │
│ │ ━━━━━━━━━━━━━━━━━              │ │
│ │ 油汚れ + カビ                    │ │
│ │ 信頼度: 85%  ████████░░          │ │
│ └─────────────────────────────────┘ │
│                                     │
│ [その他のセクション...]              │
│                                     │
└─────────────────────────────────────┘

構成:
- スクロール可能（SingleChildScrollView）
- 画像: 横幅いっぱい-32px、高さ200px、角丸12px
- 場所・素材: bodyMedium、textSecondary、📍アイコン
- 各セクション: AppCard使用、gap 16px
- セクションタイトル: titleSmall + アイコン
- 信頼度バー: LinearProgressIndicator、高さ8px、角丸4px
  - 80%以上: success
  - 60-80%: warning
  - 60%未満: error
- 保存ボタン: AppBar右、テキストボタン、labelLarge、primary
```

### 9. 履歴一覧画面 `/history`

```
┌─────────────────────────────────────┐
│ 診断履歴                            │
├─────────────────────────────────────┤
│ 今日                                │
│ ┌─────────────────────────────────┐ │
│ │ [📷] 油汚れ + カビ               │ │
│ │     キッチン / タイル            │ │
│ │     10:30                    >  │ │
│ └─────────────────────────────────┘ │
│                                     │
│ 昨日                                │
│ ┌─────────────────────────────────┐ │
│ │ [📷] 水垢                        │ │
│ │     浴室 / 鏡                    │ │
│ │     15:45                    >  │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ [🏠]        [📋]        [⚙️]        │
└─────────────────────────────────────┘

構成:
- AppBar: titleLarge中央
- 日付グループ: labelSmall、textSecondary、上padding 16px
- 履歴カード: AppCard、padding 12px
  - サムネイル: 60x60、角丸8px、左寄せ
  - 汚れタイプ: bodyLarge、fontWeight.w500
  - 場所・素材: bodySmall、textSecondary
  - 時刻: bodySmall、textSecondary、右寄せ
  - 矢印: chevron_right、textSecondary
- 空の場合: イラスト + 「履歴がありません」bodyLarge、中央
- スワイプ削除: Dismissible、error背景、ゴミ箱アイコン
```

### 10. 設定画面 `/settings`

```
┌─────────────────────────────────────┐
│ 設定                                │
├─────────────────────────────────────┤
│                                     │
│ アカウント                          │
│ ┌─────────────────────────────────┐ │
│ │ ログイン状態          未ログイン >│ │
│ ├─────────────────────────────────┤ │
│ │ データ同期                    - >│ │
│ └─────────────────────────────────┘ │
│                                     │
│ [その他のセクション...]              │
│                                     │
│ バージョン 1.0.0                    │
│                                     │
├─────────────────────────────────────┤
│ [🏠]        [📋]        [⚙️]        │
└─────────────────────────────────────┘

構成:
- セクションヘッダー: labelSmall、textSecondary、上padding 24px
- リストグループ: AppCard内、dividerで区切り
- 各項目: ListTile
  - タイトル: bodyLarge
  - 値: bodyMedium、textSecondary
  - 矢印: chevron_right、16px
  - 最小高さ: 56px（タッチターゲット）
- プレミアム: 👑アイコン、primaryLight背景
- バージョン: 画面下部、中央、bodySmall、textSecondary
```

### 11. ログイン画面 `/login`

```
┌─────────────────────────────────────┐
│ ← ログイン                          │
├─────────────────────────────────────┤
│                                     │
│         [アプリロゴ]                 │
│         Yogolyzer                   │
│                                     │
│  ログインすると                      │
│  データをクラウドに保存できます       │
│                                     │
│  [  Appleでログイン  ]              │
│                                     │
│  [ G Googleでログイン  ]            │
│                                     │
│  ログインしなくても                  │
│  アプリは使えます                   │
│                                     │
│  [スキップ]                         │
│                                     │
└─────────────────────────────────────┘

構成:
- ロゴ: 中央、80x80
- アプリ名: titleLarge、中央
- 説明: bodyMedium、textSecondary、中央
- Appleボタン: 高さ56px、黒背景、白テキスト、Appleロゴ
- Googleボタン: 高さ56px、白背景、黒テキスト、border 1px gray300
- 補足: bodySmall、textSecondary、中央
- スキップ: テキストボタン、labelLarge、textSecondary
```

### 12. プレミアム画面 `/premium`

```
┌─────────────────────────────────────┐
│                              [×]    │
├─────────────────────────────────────┤
│           👑                        │
│        Premium                      │
│                                     │
│   すべての機能を制限なく使えます     │
│                                     │
│  ┌─────────────────────────────────┐│
│  │ ✅ 診断回数 無制限              ││
│  │ ✅ 履歴 無制限保存              ││
│  │ ...                             ││
│  └─────────────────────────────────┘│
│                                     │
│  [プラン選択]                        │
│                                     │
│      [  購入する  ]                 │
│                                     │
│  購入を復元  |  利用規約            │
│                                     │
└─────────────────────────────────────┘

構成:
- BottomSheet形式、角丸上部24px
- 閉じるボタン: 右上16px、48x48
- 王冠アイコン: 48px、warning色
- タイトル: headlineSmall、中央
- 説明: bodyMedium、textSecondary
- 特典リスト: success色チェック + bodyMedium
- プラン選択: ラジオボタン付きAppCard
  - 選択: primaryLight背景、primary border 2px
  - 非選択: surface背景、border 1px
- 購入ボタン: AppButton、primary
- リンク: テキストボタン、bodySmall、textSecondary
```

---

## アニメーション・トランジション

### 画面遷移

```dart
// デフォルト: スライド（右から左）
SlideTransition(
  position: Tween<Offset>(
    begin: const Offset(1.0, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: animation,
    curve: Curves.easeOutCubic,
  )),
  duration: const Duration(milliseconds: 300),
);

// モーダル: スライド（下から上）
SlideTransition(
  position: Tween<Offset>(
    begin: const Offset(0.0, 1.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: animation,
    curve: Curves.easeOutCubic,
  )),
  duration: const Duration(milliseconds: 300),
);

// フェード（診断結果など）
FadeTransition(
  opacity: animation,
  duration: const Duration(milliseconds: 200),
);
```

### ローディング

```dart
// シンプルなローディング
CircularProgressIndicator(
  color: primary,
  strokeWidth: 3,
);

// スケルトンローディング（Shimmer効果）
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [gray200, gray100, gray200],
      stops: [0.0, 0.5, 1.0],
    ),
    borderRadius: BorderRadius.circular(radiusSm),
  ),
);
```

### インタラクション

```dart
// ボタンタップ
ScaleTransition(
  scale: Tween<double>(begin: 1.0, end: 0.95).animate(...),
  duration: const Duration(milliseconds: 100),
);

// カード選択
AnimatedContainer(
  duration: const Duration(milliseconds: 200),
  curve: Curves.easeOut,
  decoration: BoxDecoration(
    border: isSelected ? Border.all(color: primary, width: 2) : null,
  ),
);
```

### モーション設定の尊重

```dart
// prefers-reduced-motion対応
final reduceMotion = MediaQuery.of(context).disableAnimations;

AnimatedContainer(
  duration: reduceMotion
    ? Duration.zero
    : const Duration(milliseconds: 200),
  ...
);
```

---

## アクセシビリティチェックリスト

### 必須（高優先度）

- [ ] コントラスト比: すべてのテキストで4.5:1以上
- [ ] タッチターゲット: すべての操作要素で44x44px以上
- [ ] 代替テキスト: すべての画像にSemantics.label
- [ ] キーボード操作: フォーカス順序が論理的
- [ ] スクリーンリーダー: Semantics.buttonなど適切なロール

### 推奨（中優先度）

- [ ] フォントサイズ: システム設定（textScaleFactor）に対応
- [ ] 色だけに依存しない: アイコンやテキストも併用
- [ ] エラー表示: 色 + テキスト + アイコンで表現
- [ ] フォーカス表示: フォーカスリングが明確

### Flutter実装

```dart
// Semanticsの例
Semantics(
  button: true,
  label: '診断を始める',
  child: AppButton(...),
);

// ExcludeSemantics（装飾的な要素）
ExcludeSemantics(
  child: Icon(Icons.decorative),
);
```

---

## 配信前チェックリスト

### デザイン品質

- [ ] 8ptグリッドに沿ったスペーシング
- [ ] 一貫したカラー使用（トークン参照）
- [ ] 一貫したタイポグラフィ使用
- [ ] 適切なシャドウ/エレベーション
- [ ] 角丸の統一

### インタラクション

- [ ] すべてのボタンに押下状態
- [ ] すべての入力にフォーカス状態
- [ ] 適切なローディング表示
- [ ] エラー状態の表示
- [ ] 空の状態の表示

### レスポンシブ

- [ ] iPhone SE（320px幅）で崩れない
- [ ] ノッチ/ダイナミックアイランド対応（SafeArea）
- [ ] 横向き対応（必要な場合）
- [ ] テキストの折り返し確認

### パフォーマンス

- [ ] 画像の最適化（WebP推奨）
- [ ] 遅延読み込み（LazyLoad）
- [ ] 不要なリビルドの防止
- [ ] 大きなリストのListView.builder使用

---

## 実装時の注意点

1. **Material 3** を使用（Flutter 3.x以降、`useMaterial3: true`）
2. **SafeArea** を全画面で使用
3. **カラー** はThemeDataで一元管理、ハードコード禁止
4. **フォント** はGoogle Fonts（Noto Sans JP）を使用
5. **アイコン** はMaterial Symbols（Outlined推奨）
6. **画像** はcached_network_imageでキャッシュ
7. **状態管理** はRiverpod + flutter_hooks
8. **ナビゲーション** はgo_router
