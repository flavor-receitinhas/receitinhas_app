import 'package:app_receitas/src/feactures/recipes/data/database/recipe_database.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImp implements RecipeRepository {
  final RecipeDatabase data;

  RecipeRepositoryImp(this.data);

  @override
  Future<void> createRecipe(RecipeEntity recipe) {
    return data.createRecipe(recipe);
  }

  @override
  Future<RecipeEntity> getRecipe(String id) async {
    return await data.getRecipe(id);
  }

  @override
  Future<List<RecipeEntity>> listRecipe() async {
    return await data.listRecipe();
  }
}
