import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/cached_recipes_table.dart';

part 'cached_recipes_dao.g.dart';

/// レシピキャッシュDAO
@DriftAccessor(tables: [CachedRecipesTable])
class CachedRecipesDao extends DatabaseAccessor<AppDatabase>
    with _$CachedRecipesDaoMixin {
  CachedRecipesDao(super.db);

  /// 全件取得
  Future<List<CachedRecipesTableData>> getAll() {
    return select(cachedRecipesTable).get();
  }

  /// IDで取得
  Future<CachedRecipesTableData?> getById(String id) {
    return (select(cachedRecipesTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// 無料レシピのみ取得
  Future<List<CachedRecipesTableData>> getFreeRecipes() {
    return (select(cachedRecipesTable)..where((t) => t.isPremium.equals(false)))
        .get();
  }

  /// プレミアムレシピを取得
  Future<List<CachedRecipesTableData>> getPremiumRecipes() {
    return (select(cachedRecipesTable)..where((t) => t.isPremium.equals(true)))
        .get();
  }

  /// 挿入
  Future<void> insert(CachedRecipesTableCompanion entry) {
    return into(cachedRecipesTable).insert(entry);
  }

  /// 一括挿入（upsert）
  Future<void> insertAll(List<CachedRecipesTableCompanion> entries) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(cachedRecipesTable, entries);
    });
  }

  /// 削除
  Future<int> deleteById(String id) {
    return (delete(cachedRecipesTable)..where((t) => t.id.equals(id))).go();
  }

  /// 全削除
  Future<int> deleteAll() {
    return delete(cachedRecipesTable).go();
  }

  /// キャッシュが古いかチェック（24時間以上）
  Future<bool> isCacheStale() async {
    final items = await getAll();
    if (items.isEmpty) return true;

    final oldest = items
        .map((e) => e.cachedAt)
        .reduce((a, b) => a.isBefore(b) ? a : b);

    return DateTime.now().difference(oldest).inHours > 24;
  }
}
