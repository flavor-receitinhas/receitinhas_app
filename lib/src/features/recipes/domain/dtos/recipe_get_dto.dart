import 'package:app_receitas/src/features/recipes/domain/entities/recipe_entity.dart';

class RecipeGetDto {
  final String authorName;
  final RecipeEntity recipe;

  RecipeGetDto({required this.authorName, required this.recipe});

  static final empty = RecipeGetDto(
    authorName: '',
    recipe: RecipeEntity.empty(),
  );
}
