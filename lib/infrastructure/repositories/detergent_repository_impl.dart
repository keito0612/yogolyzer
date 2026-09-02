import 'dart:convert';

import 'package:drift/drift.dart';

import '../../domain/entities/detergent.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/repositories/i_detergent_repository.dart';
import '../datasources/local/daos/detergents_dao.dart';
import '../datasources/local/daos/recipes_dao.dart';
import '../datasources/local/database.dart';

/// 洗剤リポジトリの実装
class DetergentRepositoryImpl implements IDetergentRepository {
  DetergentRepositoryImpl(this._detergentsDao, this._recipesDao);

  final DetergentsDao _detergentsDao;
  final RecipesDao _recipesDao;

  @override
  Future<List<Detergent>> getDetergents() async {
    final records = await _detergentsDao.getAll();
    return records.map(_detergentToDomain).toList();
  }

  @override
  Future<List<Detergent>> getDetergentsFor({
    required String stainType,
    required String material,
  }) async {
    final all = await getDetergents();
    return all.where((d) {
      final matchesStain = d.targetStains.any(
        (s) => stainType.toLowerCase().contains(s.toLowerCase()),
      );
      final matchesMaterial = d.targetMaterials.any(
        (m) => material.toLowerCase().contains(m.toLowerCase()),
      );
      return matchesStain || matchesMaterial;
    }).toList();
  }

  @override
  Future<Detergent?> getDetergentById(String id) async {
    final record = await _detergentsDao.getById(id);
    return record != null ? _detergentToDomain(record) : null;
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    final records = await _recipesDao.getAll();
    return records.where((r) => !r.isPremium).map(_recipeToDomain).toList();
  }

  @override
  Future<List<Recipe>> getPremiumRecipes() async {
    final records = await _recipesDao.getPremiumRecipes();
    return records.map(_recipeToDomain).toList();
  }

  @override
  Future<Recipe?> getRecipeById(String id) async {
    final record = await _recipesDao.getById(id);
    return record != null ? _recipeToDomain(record) : null;
  }

  @override
  Future<List<Recipe>> getRecipesFor(String stainType) async {
    final all = await getRecipes();
    return all
        .where((r) =>
            r.targetStain.toLowerCase().contains(stainType.toLowerCase()))
        .toList();
  }

  @override
  Future<void> cacheDetergents(List<Detergent> detergents) async {
    await _detergentsDao.deleteAll();
    for (final detergent in detergents) {
      await _detergentsDao.insert(DetergentsTableCompanion(
        id: Value(detergent.id),
        name: Value(detergent.name),
        brand: Value(detergent.brand),
        type: Value(detergent.type.name),
        data: Value(jsonEncode(detergent.toJson())),
        createdAt: Value(DateTime.now()),
      ));
    }
  }

  @override
  Future<void> cacheRecipes(List<Recipe> recipes) async {
    await _recipesDao.deleteAll();
    for (final recipe in recipes) {
      await _recipesDao.insert(RecipesTableCompanion(
        id: Value(recipe.id),
        name: Value(recipe.name),
        data: Value(jsonEncode(recipe.toJson())),
        isPremium: Value(recipe.isPremium),
        createdAt: Value(DateTime.now()),
      ));
    }
  }

  Detergent _detergentToDomain(DetergentsTableData record) {
    final json = jsonDecode(record.data) as Map<String, dynamic>;
    return Detergent.fromJson(json);
  }

  Recipe _recipeToDomain(RecipesTableData record) {
    final json = jsonDecode(record.data) as Map<String, dynamic>;
    return Recipe.fromJson(json);
  }
}
