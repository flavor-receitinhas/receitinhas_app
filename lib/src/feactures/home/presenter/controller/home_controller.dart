import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/repositories/user_food_pref_repository.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final UserFoodPrefRepository _userFoodPrefRepository;

  HomeController(this._recipeRepository, this._userFoodPrefRepository);

  Future<void> listRecipe() async {
    await _recipeRepository.listRecipe();
  }

  Future<bool> verifyOnboading() async {
    final result = await _userFoodPrefRepository.getUser(id: Global.user!.id);
    if (result.dietaryRestriction.isEmpty) {
      return true;
    }
    if (result.difficultyRecipe.isEmpty) {
      return true;
    }
    if (result.protein.isEmpty) {
      return true;
    }
    return false;
  }
}
