import 'package:app_receitas/src/feactures/recipes/domain/entities/image_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';

abstract class RecipeRepository {
  Future<void> createRecipe(RecipeEntity recipe);
  Future<RecipeEntity> getRecipe(String id);
  Future<List<RecipeEntity>> getUserRecipes(String userID);
  Future<List<RecipeEntity>> listRecipe();
  Future<void> createImages(
      {required String recipeId, required String filePath});
  Future<void> deleteImages(String recipeId, String imageId);
  Future<void> createThumb(
      {required String recipeId, required String filePath});
  Future<void> deleteThumb(String recipeId, String thumbId);
  Future<List<ImageEntity>> getImages(String recipeId);
}
