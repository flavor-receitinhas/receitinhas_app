import 'package:app_receitas/src/core/services/api/api_recipes.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/mappers/ingredient_mapper.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/ingredient_repository.dart';

class IngredientRepositoryImp extends IngredientRepository {
  final IngredientMapper _mapper;
  final ApiRecipes _apiRecipes;

  IngredientRepositoryImp(this._mapper, this._apiRecipes);

  @override
  Future<IngredientEntity> createIngredient(String name) async {
    final result = await _apiRecipes.post(
      path: '/ingredient',
      body: {'name': name},
    );
    return _mapper.fromMap(result); 
  }

  @override
  Future<IngredientEntity> getIngredient(String id) async {
    final result = await _apiRecipes.get(path: '/ingredient/$id');
    return _mapper.fromMap(result);
  }

  @override
  Future<List<IngredientEntity>> listIngredient(
      {int? page, String? name}) async {
    final result = await _apiRecipes.get(
      path: '/ingredient?page=$page&name=$name',
    );
    return result.map<IngredientEntity>((e) => _mapper.fromMap(e)).toList();
  }
}
