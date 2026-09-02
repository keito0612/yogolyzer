import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/detergents_table.dart';

part 'detergents_dao.g.dart';

/// 洗剤DAO
@DriftAccessor(tables: [DetergentsTable])
class DetergentsDao extends DatabaseAccessor<AppDatabase>
    with _$DetergentsDaoMixin {
  DetergentsDao(super.db);

  /// 全件取得
  Future<List<DetergentsTableData>> getAll() {
    return select(detergentsTable).get();
  }

  /// IDで取得
  Future<DetergentsTableData?> getById(String id) {
    return (select(detergentsTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// 種類で取得
  Future<List<DetergentsTableData>> getByType(String type) {
    return (select(detergentsTable)..where((t) => t.type.equals(type)))
        .get();
  }

  /// 挿入
  Future<void> insert(DetergentsTableCompanion entry) {
    return into(detergentsTable).insert(entry);
  }

  /// 一括挿入（upsert）
  Future<void> insertAll(List<DetergentsTableCompanion> entries) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(detergentsTable, entries);
    });
  }

  /// 削除
  Future<int> deleteById(String id) {
    return (delete(detergentsTable)..where((t) => t.id.equals(id))).go();
  }

  /// 全削除
  Future<int> deleteAll() {
    return delete(detergentsTable).go();
  }
}
