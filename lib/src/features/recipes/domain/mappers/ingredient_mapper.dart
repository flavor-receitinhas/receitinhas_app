import 'package:app_receitas/src/features/recipes/domain/entities/ingredient_entity.dart';

class IngredientMapper {
  Map<String, dynamic> toMap(IngredientEntity entity) {
    return <String, dynamic>{
      'id': entity.id,
      'name': entity.name,
      'description': entity.description,
    };
  }

  IngredientEntity fromMap(Map<String, dynamic> map) {
    return IngredientEntity(
      id: map['id'] as String,
      name: map['name'],
      description: map['description'],
    );
  }
}
