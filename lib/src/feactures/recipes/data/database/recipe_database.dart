import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';

abstract class RecipeDatabase {
  Future<void> createRecipe(RecipeEntity recipe);
  Future<RecipeEntity> getRecipe();
}
