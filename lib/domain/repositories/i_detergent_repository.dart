import '../entities/detergent.dart';
import '../entities/recipe.dart';

/// 洗剤リポジトリのインターフェース
abstract interface class IDetergentRepository {
  /// 洗剤一覧を取得
  Future<List<Detergent>> getDetergents();

  /// 汚れと素材に合う洗剤を取得
  Future<List<Detergent>> getDetergentsFor({
    required String stainType,
    required String material,
  });

  /// 洗剤をIDで取得
  Future<Detergent?> getDetergentById(String id);

  /// レシピ一覧を取得
  Future<List<Recipe>> getRecipes();

  /// プレミアム限定レシピを取得
  Future<List<Recipe>> getPremiumRecipes();

  /// レシピをIDで取得
  Future<Recipe?> getRecipeById(String id);

  /// 汚れに合うレシピを取得
  Future<List<Recipe>> getRecipesFor(String stainType);

  /// 洗剤キャッシュを更新
  Future<void> cacheDetergents(List<Detergent> detergents);

  /// レシピキャッシュを更新
  Future<void> cacheRecipes(List<Recipe> recipes);
}
