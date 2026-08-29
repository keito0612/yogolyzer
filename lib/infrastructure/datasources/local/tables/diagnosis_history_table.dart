import 'package:drift/drift.dart';

/// 診断履歴テーブル
class DiagnosisHistoryTable extends Table {
  @override
  String get tableName => 'local_diagnosis_history';

  /// ID（UUID）
  TextColumn get id => text()();

  /// クラウド同期後のID（NULL可）
  TextColumn get cloudId => text().nullable()();

  /// ローカル画像パス
  TextColumn get imagePath => text()();

  /// 場所
  TextColumn get location => text()();

  /// 素材
  TextColumn get material => text()();

  /// 汚れの種類
  TextColumn get stainType => text()();

  /// 診断結果（JSON）
  TextColumn get diagnosisResult => text()();

  /// クラウド同期済みか
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  /// 診断日時
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
