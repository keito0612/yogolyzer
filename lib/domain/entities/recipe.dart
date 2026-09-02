import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

/// 自作洗剤レシピエンティティ
@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String name,
    required String targetStain,
    required List<String> ingredients,
    required List<String> instructions,
    required String usage,
    String? cautions,
    @Default(false) bool isPremium,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
