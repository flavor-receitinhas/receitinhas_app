class IngredientEntity {
  final String id;
  final String name;
  final String? description;

  IngredientEntity({
    required this.id,
    required this.name,
    this.description,
  });
}
