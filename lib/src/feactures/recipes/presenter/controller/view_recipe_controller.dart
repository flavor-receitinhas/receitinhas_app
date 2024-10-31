import 'package:app_receitas/src/feactures/recipes/domain/entities/image_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:page_manager/export_manager.dart';

class ViewRecipeController extends ManagerStore {
  final RecipeRepository _recipeRepository;

  ViewRecipeController(this._recipeRepository);

  String id = '';
  late RecipeEntity recipe;
  List<ImageEntity> images = [];
  List<IngredientRecipeEntity> ingredients = [];

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          id = arguments['id'] as String;
          recipe = await getRecipe();
          images = await getImages();
          ingredients = await getIngredientsRecipe();
        },
      );

  Future<RecipeEntity> getRecipe() async {
    return await _recipeRepository.getRecipe(id);
  }

  Future<List<ImageEntity>> getImages() async {
    final images = await _recipeRepository.getImages(id);
    return images.where((e) => !e.thumb).toList();
  }

  Future<List<IngredientRecipeEntity>> getIngredientsRecipe() async {
    return await _recipeRepository.getIngredientsRecipe(id);
  }
}
