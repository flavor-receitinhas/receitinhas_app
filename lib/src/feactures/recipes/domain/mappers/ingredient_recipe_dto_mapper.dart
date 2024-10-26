import 'package:app_receitas/src/feactures/recipes/domain/dtos/ingredient_recipe_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_recipe_entity.dart';

class IngredientRecipeDtoMapper {
  IngredientRecipeDto fromMap(Map<String, dynamic> map) {
    return IngredientRecipeDto(
      id: map['id'],
      ingredientId: map['ingredientId'],
      recipeId: map['recipeId'],
      quantity: map['quantity'],
      unit: map['unit'],
      ingredientName: map['ingredientName'],
    );
  }

  Map<String, dynamic> toMap(IngredientRecipeDto dto) {
    return {
      'id': dto.id,
      'ingredientId': dto.ingredientId,
      'recipeId': dto.recipeId,
      'quantity': dto.quantity,
      'unit': dto.unit,
      'ingredientName': dto.ingredientName,
    };
  }

  IngredientRecipeEntity toEntity(IngredientRecipeDto dto) {
    return IngredientRecipeEntity(
      ingredient: IngredientEntity(
        id: dto.ingredientId,
        name: dto.ingredientName,
      ),
      quantity: dto.quantity,
      unit: dto.unit,
    );
  }
}
