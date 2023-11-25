import 'package:app_receitas/src/feactures/recipes/data/database/recipe_database.dart';
import 'package:app_receitas/src/feactures/recipes/data/mappers/recipe_mapper.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:dio/dio.dart';

class RecipeDatabaseImp implements RecipeDatabase {
  final Dio dio;
  final RecipeMapper _mapper;

  RecipeDatabaseImp(
    this.dio,
    this._mapper,
  );

  String url = 'http://192.168.1.6:8080';
  String path = '/recipe';

  @override
  Future<void> createRecipe(RecipeEntity recipe) async {
    await dio.put('$url/$path', data: _mapper.toMap(recipe));
  }

  @override
  Future<RecipeEntity> getRecipe() async {
    final response = await dio.get('$url/$path');
    final result = _mapper.fromMap(response.data);
    return result;
  }
}
