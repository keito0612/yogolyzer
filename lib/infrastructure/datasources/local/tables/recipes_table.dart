import 'package:drift/drift.dart';

/// レシピテーブル
class RecipesTable extends Table {
  @override
  String get tableName => 'recipes';

  /// ID（UUID）
  TextColumn get id => text()();

  /// レシピ名
  TextColumn get name => text()();

  /// 全データ（JSON）
  TextColumn get data => text()();

  /// プレミアム限定か
  BoolColumn get isPremium => boolean().withDefault(const Constant(false))();

  /// 作成日時
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
