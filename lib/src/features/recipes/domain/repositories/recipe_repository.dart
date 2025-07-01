import 'package:app_receitas/src/features/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/features/recipes/domain/dtos/recipe_get_dto.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/image_entity.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/features/recipes/domain/enum/order_recipe_enum.dart';

abstract class RecipeRepository {
  Future<RecipeEntity> createRecipe(RecipeEntity recipe);
  Future<RecipeGetDto> getRecipe(String id);
  Future<List<RecipeDto>> getUserRecipes({
    required String userID,
    int page,
    bool isDesc = true,
    String? search,
  });
  Future<List<RecipeDto>> listRecipe({
    String? search,
    bool isDesc = true,
    OrderRecipeEnum? orderBy,
    required int page,
    int? timePreparedTo,
    int? timePreparedFrom,
    int? portionTo,
    int? portionFrom,
    String? difficultyRecipe,
  });
  Future<void> createImages({
    required String recipeId,
    required String filePath,
  });
  Future<void> deleteImages(String recipeId, String imageId);
  Future<void> createThumb({
    required String recipeId,
    required String filePath,
  });
  Future<void> deleteThumb(String recipeId, String thumbId);
  Future<List<ImageEntity>> getImages(String recipeId);
  Future<void> insertIngredient({
    required String recipeId,
    required List<IngredientRecipeEntity> ingredient,
  });
  Future<List<IngredientRecipeEntity>> getIngredientsRecipe(String recipeId);
  Future<void> viewRecipe(String recipeId);
  Future<void> deleteRecipe(String recipeId);
  Future<void> updateRecipe(RecipeEntity recipe);
}
