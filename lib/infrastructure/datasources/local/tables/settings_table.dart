import 'package:drift/drift.dart';

/// ユーザー設定テーブル
class SettingsTable extends Table {
  @override
  String get tableName => 'local_settings';

  /// ID（1固定）
  IntColumn get id => integer()();

  /// デバイスID
  TextColumn get deviceId => text()();

  /// ログイン状態
  BoolColumn get isLoggedIn => boolean().withDefault(const Constant(false))();

  /// ユーザーID（NULL可）
  TextColumn get userId => text().nullable()();

  /// プレミアム会員か
  BoolColumn get isPremium => boolean().withDefault(const Constant(false))();

  /// 今日の診断回数
  IntColumn get dailyDiagnosisCount =>
      integer().withDefault(const Constant(0))();

  /// 最後に診断した日（NULL可）
  DateTimeColumn get lastDiagnosisDate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
