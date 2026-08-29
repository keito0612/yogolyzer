import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/cached_detergents_table.dart';

part 'cached_detergents_dao.g.dart';

/// 洗剤キャッシュDAO
@DriftAccessor(tables: [CachedDetergentsTable])
class CachedDetergentsDao extends DatabaseAccessor<AppDatabase>
    with _$CachedDetergentsDaoMixin {
  CachedDetergentsDao(super.db);

  /// 全件取得
  Future<List<CachedDetergentsTableData>> getAll() {
    return select(cachedDetergentsTable).get();
  }

  /// IDで取得
  Future<CachedDetergentsTableData?> getById(String id) {
    return (select(cachedDetergentsTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// 種類で取得
  Future<List<CachedDetergentsTableData>> getByType(String type) {
    return (select(cachedDetergentsTable)..where((t) => t.type.equals(type)))
        .get();
  }

  /// 挿入
  Future<void> insert(CachedDetergentsTableCompanion entry) {
    return into(cachedDetergentsTable).insert(entry);
  }

  /// 一括挿入（upsert）
  Future<void> insertAll(List<CachedDetergentsTableCompanion> entries) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(cachedDetergentsTable, entries);
    });
  }

  /// 削除
  Future<int> deleteById(String id) {
    return (delete(cachedDetergentsTable)..where((t) => t.id.equals(id))).go();
  }

  /// 全削除
  Future<int> deleteAll() {
    return delete(cachedDetergentsTable).go();
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
