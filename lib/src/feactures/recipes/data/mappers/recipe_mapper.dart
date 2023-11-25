import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';

class RecipeMapper {
  Map<String, dynamic> toMap(RecipeEntity entity) {
    return <String, dynamic>{
      'id': entity.id,
      'title': entity.title,
      'subTitle': entity.subTitle,
      'image': entity.image,
      'details': entity.details,
      'timePrepared': entity.timePrepared,
      'difficultyRecipes': entity.difficultyRecipes.name,
      'portion': entity.portion,
      'ingredient': entity.ingredient,
      'prepare': entity.prepare,
      'serveFood': entity.serveFood,
    };
  }

  RecipeEntity fromMap(Map<String, dynamic> map) {
    return RecipeEntity(
      id: map['id'] as int,
      title: map['title'] as String,
      subTitle: map['subTitle'] as String?,
      image: (map['image'] as List).map<String>((e) => e.toString()).toList(),
      details: map['details'] as String?,
      timePrepared: map['timePrepared'] as int,
      difficultyRecipes: DifficultyRecipes.fromName(
        map['difficultyRecipes'] as String,
      ),
      portion: map['portion'] as int,
      ingredient: map['ingredient'],
      prepare: map['prepare'],
      serveFood: map['serveFood'] as String?,
    );
  }
}
