import 'package:app_receitas/src/features/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/recipe_entity.dart';

class RecipeMapper {
  Map<String, dynamic> toMap(RecipeEntity entity) {
    return <String, dynamic>{
      'title': entity.title,
      'subTitle': entity.subTitle,
      'details': entity.details,
      'timePrepared': entity.timePrepared,
      'difficultyRecipe': entity.difficultyRecipe.name,
      'portion': entity.portion,
      'instruction': entity.instruction,
      'serveFood': entity.serveFood,
      'status': entity.status,
      'userId': entity.userId,
      'createdAt': entity.createdAt,
      'updatedAt': entity.updatedAt,
    };
  }

  RecipeEntity fromMap(Map<String, dynamic> map) {
    return RecipeEntity(
      id: map['id'],
      userId: map['userId'],
      updatedAt: map['updatedAt'],
      createdAt: map['createdAt'],
      status: map['status'],
      title: map['title'] as String,
      subTitle: map['subTitle'] as String?,
      details: map['details'] as String?,
      timePrepared: map['timePrepared'],
      difficultyRecipe: DifficultyRecipe.values.firstWhere(
        (e) => e.toString().split('.').last == map['difficultyRecipe'],
      ),
      portion: map['portion'] as int,
      instruction: map['instruction'],
      serveFood: map['serveFood'] as String?,
    );
  }
}
