import 'package:drift/drift.dart';

/// 洗剤キャッシュテーブル
class CachedDetergentsTable extends Table {
  @override
  String get tableName => 'cached_detergents';

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

  /// キャッシュ日時
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
