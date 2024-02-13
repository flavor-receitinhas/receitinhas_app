import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';

class ResearchController extends ChangeNotifier {
  final RecipeRepository _recipeRepository;

  ResearchController(
    this._recipeRepository,
  );

  List<RecipeEntity> recipes = [];

  Future<void> init() async {
    recipes = await listRecipe();
    notifyListeners();
  }

  Future<List<RecipeEntity>> listRecipe() async {
    return await _recipeRepository.listRecipe();
  }
}
