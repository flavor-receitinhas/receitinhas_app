import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_entity.dart';

abstract class IngredientRepository {
  Future<List<IngredientEntity>> listIngredient({int? page, String? name});
  Future<IngredientEntity> getIngredient(String id);
  Future<IngredientEntity> createIngredient(String name);
}
