import 'package:app_receitas/src/core/services/api/api_recipes.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/image_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/enum/order_recipe_enum.dart';
import 'package:app_receitas/src/feactures/recipes/domain/mappers/image_mapper.dart';
import 'package:app_receitas/src/feactures/recipes/domain/mappers/recipe_mapper.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class RecipeRepositoryImp implements RecipeRepository {
  final RecipeMapper _mapper;
  final ApiRecipes _apiRecipes;
  final ImageMapper _imageMapper;

  RecipeRepositoryImp(
    this._mapper,
    this._apiRecipes,
    this._imageMapper,
  );

  String path = '/recipe';

  @override
  Future<RecipeEntity> createRecipe(RecipeEntity recipe) async {
    final result =
        await _apiRecipes.post(path: path, body: _mapper.toMap(recipe));
    print(result);
    return _mapper.fromMap(result);
  }

  @override
  Future<RecipeEntity> getRecipe(String id) async {
    final result = await _apiRecipes.get(path: '$path/$id');

    return _mapper.fromMap(result);
  }

  @override
  Future<List<ImageEntity>> getImages(String recipeId) async {
    final result = await _apiRecipes.get(path: '$path/$recipeId/images');

    return result.map<ImageEntity>((e) => _imageMapper.fromMap(e)).toList();
  }

  @override
  Future<List<RecipeEntity>> getUserRecipes(String userId) async {
    final result = await _apiRecipes.get(path: '$path/user/$userId');

    return result.map<RecipeEntity>((e) => _mapper.fromMap(e)).toList();
  }

  @override
  Future<void> createImages(
      {required String recipeId, required String filePath}) async {
    final data = {
      "file": await MultipartFile.fromFile(filePath,
          contentType: MediaType('image', 'jpg')),
    };
    await _apiRecipes.put(
      path: '$path/$recipeId/images',
      body: data,
    );
  }

  @override
  Future<void> createThumb(
      {required String recipeId, required String filePath}) async {
    final data = {
      "file": await MultipartFile.fromFile(filePath,
          contentType: MediaType('image', 'jpg')),
    };
    await _apiRecipes.put(
      path: '$path/$recipeId/thumbs',
      body: data,
    );
  }

  @override
  Future<void> deleteImages(String recipeId, String imageId) async {
    await _apiRecipes.delete(
      path: '$path/$recipeId/images/$imageId',
    );
  }

  @override
  Future<void> deleteThumb(String recipeId, String thumbId) async {
    await _apiRecipes.delete(
      path: '$path/$recipeId/thumbs/$thumbId',
    );
  }

  @override
  Future<List<RecipeDto>> listRecipe(
      {String? search,
      String? isDesc,
      OrderRecipeEnum? orderBy,
      required int page,
      int? timePreparedTo,
      int? timePreparedFrom,
      int? portionTo,
      int? portionFrom,
      DifficultyRecipe? difficultyRecipe}) async {
    final result = await _apiRecipes.get(
      path:
          '$path?search=$search&page=$page&isDesc=$isDesc&sort=${orderBy?.name}&timePreparedTo=$timePreparedTo&timePreparedFrom=$timePreparedFrom&portionTo=$portionTo&portionFrom=$portionFrom&difficultyRecipe=${difficultyRecipe?.name}',
    );

    return result.map<RecipeEntity>((e) => _mapper.fromMap(e)).toList();
  }
}
