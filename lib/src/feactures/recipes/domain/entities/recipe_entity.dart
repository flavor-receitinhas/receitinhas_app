import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';

class RecipeEntity {
  final int id;
  final String title;
  final String? subTitle;
  final List<String> image;
  final String? details;
  final int timePrepared;
  final DifficultyRecipes difficultyRecipes;
  final int portion;
  final List<String> ingredient;
  final List<String> prepare;
  final String? serveFood;

  RecipeEntity(
      {required this.id,
      required this.title,
      this.subTitle,
      required this.image,
      this.details,
      required this.timePrepared,
      required this.difficultyRecipes,
      required this.portion,
      required this.ingredient,
      required this.prepare,
      this.serveFood});
}
