import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/library/dio_client.dart';
import 'package:app_receitas/src/feactures/recipes/data/database/recipe_database.dart';
import 'package:app_receitas/src/feactures/recipes/data/mappers/recipe_mapper.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';

class RecipeDatabaseImp implements RecipeDatabase {
  final DioClient dio;
  final RecipeMapper _mapper;

  RecipeDatabaseImp(
    this.dio,
    this._mapper,
  );

  String url = Global.dnsApi;
  String path = 'recipe';

  @override
  Future<void> createRecipe(RecipeEntity recipe) async {
    await dio.post(
      '$url/$path',
      body: _mapper.toMap(recipe),
      headers: {
        'Authorization': Global.token,
      },
    );
  }

  @override
  Future<RecipeEntity> getRecipe(String id) async {
    final response = await dio.get(
      '$url/$path/$id',
      headers: {
        'Authorization': Global.token,
      },
    );
    final result = _mapper.fromMap(response.data);
    return result;
  }

  @override
  Future<List<RecipeEntity>> listRecipe() async {
    final response = await dio.get(
      '$url/$path',
      headers: {
        'Authorization': Global.token,
      },
    );
    final result =
        response.data.map<RecipeEntity>((e) => _mapper.fromMap(e)).toList();
    return result;
  }
}
