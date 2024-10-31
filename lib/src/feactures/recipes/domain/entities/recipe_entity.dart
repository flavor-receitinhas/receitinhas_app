import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';

class RecipeEntity {
  final String? id;
  final String? userId;
  final String title;
  final String? subTitle;
  final String? details;
  final int timePrepared;
  final DifficultyRecipe difficultyRecipe;
  final int portion;
  final String instruction;
  final String? serveFood;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  RecipeEntity({
    this.id,
    required this.title,
    this.subTitle,
    this.details,
    required this.timePrepared,
    required this.difficultyRecipe,
    required this.portion,
    required this.instruction,
    this.serveFood,
    this.status,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });
}
