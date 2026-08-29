import 'package:drift/drift.dart';

/// レシピキャッシュテーブル
class CachedRecipesTable extends Table {
  @override
  String get tableName => 'cached_recipes';

  /// ID（UUID）
  TextColumn get id => text()();

  /// レシピ名
  TextColumn get name => text()();

  /// 全データ（JSON）
  TextColumn get data => text()();

  /// プレミアム限定か
  BoolColumn get isPremium => boolean().withDefault(const Constant(false))();

  /// キャッシュ日時
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
