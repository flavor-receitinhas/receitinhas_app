import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';

class ViewRecipeController extends ChangeNotifier {
  final RecipeRepository _recipeRepository;

  ViewRecipeController(this._recipeRepository);

  String id = '';
  late RecipeEntity recipe;
  PageState state = PageState.loading;

  void init(context) async {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    id = arguments.toString();
    print(id);
    recipe = await getRecipe();
    state = PageState.done;
    notifyListeners();
  }

  Future<RecipeEntity> getRecipe() async {
    return await _recipeRepository.getRecipe(id);
  }
}
