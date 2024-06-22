import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';

abstract class RecipeRepository {
   Future<void> createRecipe(RecipeEntity recipe);
  Future<RecipeEntity> getRecipe(String id);
  Future<List<RecipeEntity>> getUserRecipes(String userID);
  Future<List<RecipeEntity>> listRecipe();
}
