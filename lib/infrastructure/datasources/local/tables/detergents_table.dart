import 'package:drift/drift.dart';

/// 洗剤テーブル
class DetergentsTable extends Table {
  @override
  String get tableName => 'detergents';

  /// ID（UUID）
  TextColumn get id => text()();

  /// 商品名
  TextColumn get name => text()();

  /// ブランド名
  TextColumn get brand => text()();

  /// 種類（alkaline/acidic/neutral）
  TextColumn get type => text()();

  /// 全データ（JSON）
  TextColumn get data => text()();

  /// 作成日時
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
