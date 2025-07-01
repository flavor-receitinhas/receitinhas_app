import 'package:app_receitas/src/features/onboarding/domain/enums/difficulty_recipe_enum.dart';

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

  static empty() => RecipeEntity(
    id: '',
    title: '',
    subTitle: '',
    details: '',
    timePrepared: 0,
    difficultyRecipe: DifficultyRecipe.easy,
    portion: 0,
    instruction: '',
    serveFood: '',
    status: '',
    userId: '',
    createdAt: '',
    updatedAt: '',
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'subTitle': subTitle,
      'details': details,
      'timePrepared': timePrepared,
      'difficultyRecipe': difficultyRecipe.name,
      'portion': portion,
      'instruction': instruction,
      'serveFood': serveFood,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
