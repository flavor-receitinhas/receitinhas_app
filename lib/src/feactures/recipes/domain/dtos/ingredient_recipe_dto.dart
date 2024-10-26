class IngredientRecipeDto {
  final String id;
  final String ingredientId;
  final String recipeId;
  final double quantity;
  final String unit;
  final String ingredientName;

  IngredientRecipeDto({
    required this.id,
    required this.ingredientId,
    required this.recipeId,
    required this.quantity,
    required this.unit,
    required this.ingredientName,
  });
}
