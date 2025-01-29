import 'package:app_receitas/src/features/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/features/recipes/domain/mappers/ingredient_mapper.dart';

class IngredientRecipeMapper {
  IngredientRecipeEntity fromJson(Map<String, dynamic> json) {
    return IngredientRecipeEntity(
      ingredient: IngredientMapper().fromMap(json['ingredient']),
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson(IngredientRecipeEntity ingredient) {
    return {
      'ingredient': IngredientMapper().toMap(ingredient.ingredient),
      'quantity': ingredient.quantity,
      'unit': ingredient.unit,
    };
  }
}
