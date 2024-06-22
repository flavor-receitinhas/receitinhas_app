import 'package:app_receitas/src/core/services/api/api_recipes.dart';
import 'package:app_receitas/src/feactures/recipes/domain/mappers/recipe_mapper.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImp implements RecipeRepository {
  final RecipeMapper _mapper;
  final ApiRecipes _apiRecipes;

  RecipeRepositoryImp(
    this._mapper,
    this._apiRecipes,
  );

  String path = '/recipe';

  @override
  Future<void> createRecipe(RecipeEntity recipe) async {
    await _apiRecipes.post(path: path, body: _mapper.toMap(recipe));
  }

  @override
  Future<RecipeEntity> getRecipe(String id) async {
    final result = await _apiRecipes.get(path: '$path/$id');

    return _mapper.fromMap(result);
  }

  @override
  Future<List<RecipeEntity>> listRecipe() async {
    final result = await _apiRecipes.get(path: path);

    return result.map<RecipeEntity>((e) => _mapper.fromMap(e)).toList();
  }

  @override
  Future<List<RecipeEntity>> getUserRecipes(String userID) async {
    final result = await _apiRecipes.get(path: '$path/user/$userID');

    return result.map<RecipeEntity>((e) => _mapper.fromMap(e)).toList();
  }
}
