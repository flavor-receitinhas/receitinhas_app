import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/services/api/api_recipes.dart';
import 'package:app_receitas/src/feactures/recipes/data/database/recipe_database.dart';
import 'package:app_receitas/src/feactures/recipes/data/mappers/recipe_mapper.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';

class RecipeDatabaseImp implements RecipeDatabase {
  final RecipeMapper _mapper;
  final ApiRecipes _apiRecipes;

  RecipeDatabaseImp(
    this._mapper,
    this._apiRecipes,
  );

  String url = Global.dnsApi;
  String path = 'recipe';

  @override
  Future<void> createRecipe(RecipeEntity recipe) async {
    await _apiRecipes.post(path: '$url/$path', body: _mapper.toMap(recipe));
  }

  @override
  Future<RecipeEntity> getRecipe(String id) async {
    final result = await _apiRecipes.get(path: '$url/$path/$id');

    return _mapper.fromMap(result);
  }

  @override
  Future<List<RecipeEntity>> listRecipe() async {
    final result = await _apiRecipes.get(path: '$url/$path');

    return result.map<RecipeEntity>((e) => _mapper.fromMap(e)).toList();
  }
}
