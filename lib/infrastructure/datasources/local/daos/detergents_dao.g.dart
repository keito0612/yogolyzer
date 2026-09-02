// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detergents_dao.dart';

// ignore_for_file: type=lint
mixin _$DetergentsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DetergentsTableTable get detergentsTable => attachedDatabase.detergentsTable;
  DetergentsDaoManager get managers => DetergentsDaoManager(this);
}

class DetergentsDaoManager {
  final _$DetergentsDaoMixin _db;
  DetergentsDaoManager(this._db);
  $$DetergentsTableTableTableManager get detergentsTable =>
      $$DetergentsTableTableTableManager(
        _db.attachedDatabase,
        _db.detergentsTable,
      );
}
