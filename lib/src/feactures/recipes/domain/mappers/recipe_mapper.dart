import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/mappers/ingredient_recipe_mapper.dart';

class RecipeMapper {
  Map<String, dynamic> toMap(RecipeEntity entity) {
    return <String, dynamic>{
      'title': entity.title,
      'subTitle': entity.subTitle,
      'details': entity.details,
      'timePrepared': entity.timePrepared,
      'difficultyRecipe': entity.difficultyRecipe.name,
      'portion': entity.portion,
      'ingredients': entity.ingredients
          .map((e) => IngredientRecipeMapper.toJson(e))
          .toList(),
      'instruction': entity.instruction,
      'serveFood': entity.serveFood,
    };
  }

  RecipeEntity fromMap(Map<String, dynamic> map) {
    return RecipeEntity(
      id: map['id'] as String,
      title: map['title'] as String,
      subTitle: map['subTitle'] as String?,
      details: map['details'] as String?,
      timePrepared: map['timePrepared'] as int,
      difficultyRecipe: DifficultyRecipe.values.firstWhere(
        (e) => e.toString().split('.').last == map['difficultyRecipe'],
      ),
      portion: map['portion'] as int,
      ingredients: map['ingredients']
          .map((e) => IngredientRecipeMapper.fromJson(e))
          .toList(),
      instruction: map['instruction'],
      serveFood: map['serveFood'] as String?,
    );
  }
}
