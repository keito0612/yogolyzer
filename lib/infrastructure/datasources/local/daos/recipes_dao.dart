import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/recipes_table.dart';

part 'recipes_dao.g.dart';

/// レシピDAO
@DriftAccessor(tables: [RecipesTable])
class RecipesDao extends DatabaseAccessor<AppDatabase>
    with _$RecipesDaoMixin {
  RecipesDao(super.db);

  /// 全件取得
  Future<List<RecipesTableData>> getAll() {
    return select(recipesTable).get();
  }

  /// IDで取得
  Future<RecipesTableData?> getById(String id) {
    return (select(recipesTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// 無料レシピのみ取得
  Future<List<RecipesTableData>> getFreeRecipes() {
    return (select(recipesTable)..where((t) => t.isPremium.equals(false)))
        .get();
  }

  /// プレミアムレシピを取得
  Future<List<RecipesTableData>> getPremiumRecipes() {
    return (select(recipesTable)..where((t) => t.isPremium.equals(true)))
        .get();
  }

  /// 挿入
  Future<void> insert(RecipesTableCompanion entry) {
    return into(recipesTable).insert(entry);
  }

  /// 一括挿入（upsert）
  Future<void> insertAll(List<RecipesTableCompanion> entries) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(recipesTable, entries);
    });
  }

  /// 削除
  Future<int> deleteById(String id) {
    return (delete(recipesTable)..where((t) => t.id.equals(id))).go();
  }

  /// 全削除
  Future<int> deleteAll() {
    return delete(recipesTable).go();
  }
}
