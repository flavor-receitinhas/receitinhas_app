import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';

class RecipeGetDto {
  final String authorName;
  final RecipeEntity recipe;

  RecipeGetDto({required this.authorName, required this.recipe});
}
