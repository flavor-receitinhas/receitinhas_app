import 'package:app_receitas/src/features/recipes/domain/dtos/recipe_get_dto.dart';
import 'package:app_receitas/src/features/recipes/domain/mappers/recipe_mapper.dart';

class RecipeGetMapper {
  Map<String, dynamic> toMap(RecipeGetDto entity) {
    return <String, dynamic>{
      'authorName': entity.authorName,
      'recipe': RecipeMapper().toMap(entity.recipe),
    };
  }

  RecipeGetDto fromMap(Map<String, dynamic> map) {
    return RecipeGetDto(
      authorName: map['authorName'],
      recipe: RecipeMapper().fromMap(map['recipe']),
    );
  }
}
