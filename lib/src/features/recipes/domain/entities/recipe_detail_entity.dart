import 'package:app_receitas/src/features/favorite/domain/dtos/favorite_recipe_dto.dart';
import 'package:app_receitas/src/features/favorite/domain/mappers/favorite_recipe_mapper.dart';
import 'package:app_receitas/src/features/recipes/domain/dtos/ingredient_recipe_dto.dart';
import 'package:app_receitas/src/features/recipes/domain/dtos/recipe_get_dto.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/image_entity.dart';
import 'package:app_receitas/src/features/recipes/domain/mappers/image_mapper.dart';
import 'package:app_receitas/src/features/recipes/domain/mappers/ingredient_recipe_dto_mapper.dart';
import 'package:app_receitas/src/features/recipes/domain/mappers/recipe_get_mapper.dart';

class RecipeDetailEntity {
  final RecipeGetDto recipe;
  final List<ImageEntity> images;
  final List<IngredientRecipeDto> ingredients;
  final FavoriteRecipeDto favorite;

  RecipeDetailEntity({
    required this.recipe,
    required this.images,
    required this.ingredients,
    required this.favorite,
  });

  factory RecipeDetailEntity.fromMap(Map<String, dynamic> map) {
    return RecipeDetailEntity(
      recipe: RecipeGetMapper().fromMap(map['recipe'] as Map<String, dynamic>),
      images: List<ImageEntity>.from(
        (map['images']).map<ImageEntity>(
          (x) => ImageMapper().fromMap(x as Map<String, dynamic>),
        ),
      ),
      ingredients: List<IngredientRecipeDto>.from(
        (map['ingredients']).map<IngredientRecipeDto>(
          (x) => IngredientRecipeDtoMapper().fromMap(x as Map<String, dynamic>),
        ),
      ),
      favorite: FavoriteRecipeMapper.fromJson(map['favorite']),
    );
  }
}
