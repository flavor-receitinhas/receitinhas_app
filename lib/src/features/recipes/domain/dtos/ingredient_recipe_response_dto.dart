import 'package:app_receitas/src/features/recipes/domain/entities/ingredient_recipe_entity.dart';

class IngredientRecipeResponseDto {
  final String ingredientId;
  final double quantity;
  final String unit;

  IngredientRecipeResponseDto({
    required this.ingredientId,
    required this.quantity,
    required this.unit,
  });

  factory IngredientRecipeResponseDto.fromJson(Map<String, dynamic> json) {
    return IngredientRecipeResponseDto(
      ingredientId: json['ingredientId'],
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ingredientId': ingredientId,
      'quantity': quantity,
      'unit': unit,
    };
  }

 factory IngredientRecipeResponseDto.toDto(IngredientRecipeEntity entity) {
    return IngredientRecipeResponseDto(
      ingredientId: entity.ingredient.id,
      quantity: entity.quantity,
      unit: entity.unit,
    );
  }
}
