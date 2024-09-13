import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_entity.dart';

class IngredientMapper {
  Map<String, dynamic> toMap(IngredientEntity entity) {
    return <String, dynamic>{
      
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
