import 'package:app_receitas/src/core/services/api/api_recipes.dart';
import 'package:app_receitas/src/feactures/recipes/domain/dtos/ingredient_recipe_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/dtos/ingredient_recipe_response_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/dtos/recipe_get_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/image_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/enum/order_recipe_enum.dart';
import 'package:app_receitas/src/feactures/recipes/domain/mappers/image_mapper.dart';
import 'package:app_receitas/src/feactures/recipes/domain/mappers/ingredient_recipe_dto_mapper.dart';
import 'package:app_receitas/src/feactures/recipes/domain/mappers/recipe_get_mapper.dart';
import 'package:app_receitas/src/feactures/recipes/domain/mappers/recipe_mapper.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class RecipeRepositoryImp implements RecipeRepository {
  final RecipeMapper _mapper;
  final ApiRecipes _apiRecipes;
  final ImageMapper _imageMapper;
  final IngredientRecipeDtoMapper _ingredientDtoMapper;
  final RecipeGetMapper _recipeGetMapper;

  RecipeRepositoryImp(
    this._mapper,
    this._apiRecipes,
    this._imageMapper,
    this._ingredientDtoMapper,
    this._recipeGetMapper,
  );

  String path = '/recipe';

  @override
  Future<RecipeEntity> createRecipe(RecipeEntity recipe) async {
    final result =
        await _apiRecipes.post(path: path, body: _mapper.toMap(recipe));

    return _mapper.fromMap(result);
  }

  @override
  Future<RecipeGetDto> getRecipe(String id) async {
    final result = await _apiRecipes.get(path: '$path/$id');

    return _recipeGetMapper.fromMap(result);
  }

  @override
  Future<List<ImageEntity>> getImages(String recipeId) async {
    final result = await _apiRecipes.get(path: '$path/$recipeId/images');

    return result.map<ImageEntity>((e) => _imageMapper.fromMap(e)).toList();
  }

  @override
  Future<List<RecipeDto>> getUserRecipes(
      {required String userID, int page = 0, bool isDesc = true}) async {
    final result = await _apiRecipes.get(
        path: '$path/user/$userID?page=$page&isDesc=$isDesc');

    return result.map<RecipeDto>((e) => RecipeDto.fromMap(e)).toList();
  }

  @override
  Future<void> createImages(
      {required String recipeId, required String filePath}) async {
    final data = {
      "file": await MultipartFile.fromFile(filePath,
          contentType: MediaType('image', 'jpg')),
    };
    await _apiRecipes.post(
      path: '$path/$recipeId/images',
      body: data,
      isformData: true,
    );
  }

  @override
  Future<void> createThumb(
      {required String recipeId, required String filePath}) async {
    final data = {
      "file": await MultipartFile.fromFile(filePath,
          contentType: MediaType('image', 'jpg')),
    };
    await _apiRecipes.post(
      path: '$path/$recipeId/thumbs',
      body: data,
      isformData: true,
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
      bool isDesc = true,
      OrderRecipeEnum? orderBy,
      required int page,
      int? timePreparedTo,
      int? timePreparedFrom,
      int? portionTo,
      int? portionFrom,
      String? difficultyRecipe}) async {
    List<String> queryParams = [];
    if (search != null) queryParams.add('search=$search');
    queryParams.add('isDesc=$isDesc');
    if (orderBy != null) queryParams.add('sort=${orderBy.name}');
    if (timePreparedTo != null) {
      queryParams.add('timePreparedTo=$timePreparedTo');
    }
    if (timePreparedFrom != null) {
      queryParams.add('timePreparedFrom=$timePreparedFrom');
    }
    if (portionTo != null) queryParams.add('portionTo=$portionTo');
    if (portionFrom != null) queryParams.add('portionFrom=$portionFrom');
    if (difficultyRecipe != null) {
      queryParams.add('difficultyRecipe=$difficultyRecipe');
    }

    String queryString = queryParams.join('&');
    final result = await _apiRecipes.get(
      path: '$path?page=$page&$queryString',
    );

    return result.map<RecipeDto>((e) => RecipeDto.fromMap(e)).toList();
  }

  @override
  Future<void> insertIngredient(
      {required String recipeId,
      required List<IngredientRecipeEntity> ingredient}) async {
    final data = ingredient
        .map(
          (e) => IngredientRecipeResponseDto.toDto(e).toJson(),
        )
        .toList();
    await _apiRecipes.post(
      path: '$path/$recipeId/ingredients',
      body: data,
    );
  }

  @override
  Future<List<IngredientRecipeEntity>> getIngredientsRecipe(
      String recipeId) async {
    final result = await _apiRecipes.get(
      path: '$path/$recipeId/ingredients',
    );
    final List<IngredientRecipeDto> ingredients = result
        .map<IngredientRecipeDto>((e) => _ingredientDtoMapper.fromMap(e))
        .toList();

    return ingredients
        .map<IngredientRecipeEntity>((e) => _ingredientDtoMapper.toEntity(e))
        .toList();
  }
}
