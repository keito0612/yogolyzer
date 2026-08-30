// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_recipes_dao.dart';

// ignore_for_file: type=lint
mixin _$CachedRecipesDaoMixin on DatabaseAccessor<AppDatabase> {
  $CachedRecipesTableTable get cachedRecipesTable =>
      attachedDatabase.cachedRecipesTable;
  CachedRecipesDaoManager get managers => CachedRecipesDaoManager(this);
}

class CachedRecipesDaoManager {
  final _$CachedRecipesDaoMixin _db;
  CachedRecipesDaoManager(this._db);
  $$CachedRecipesTableTableTableManager get cachedRecipesTable =>
      $$CachedRecipesTableTableTableManager(
        _db.attachedDatabase,
        _db.cachedRecipesTable,
      );
}
