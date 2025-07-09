class IngredientEntity {
  final String id;
  final String name;
  final String? description;

  IngredientEntity({required this.id, required this.name, this.description});

  static IngredientEntity fromMap(Map<String, dynamic> map) {
    return IngredientEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String?,
    );
  }
}
