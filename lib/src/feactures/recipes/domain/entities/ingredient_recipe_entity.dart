import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_entity.dart';

class IngredientRecipeEntity {
  final IngredientEntity ingredient;
  final double quantity;
  final String unit;

  IngredientRecipeEntity({
    required this.ingredient,
    required this.quantity,
    required this.unit,
  });
}
