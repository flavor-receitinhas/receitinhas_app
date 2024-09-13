import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/mappers/ingredient_mapper.dart';

class IngredientRecipeMapper {
  static IngredientRecipeEntity fromJson(Map<String, dynamic> json) {
    return IngredientRecipeEntity(
      ingredient:
          json['ingredient'].map((e) => IngredientMapper().toMap(e)).toList(),
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }

  static Map<String, dynamic> toJson(IngredientRecipeEntity ingredient) {
    return {
      'ingredient': ingredient.ingredient,
      'quantity': ingredient.quantity,
      'unit': ingredient.unit,
    };
  }
}
