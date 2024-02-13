// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  RecipeRepository _recipeRepository;

  HomeController(
    this._recipeRepository,
  );

  Future<void> listRecipe() async {
    await _recipeRepository.listRecipe();
  }
}
