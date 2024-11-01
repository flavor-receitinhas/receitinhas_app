import 'package:app_receitas/src/core/services/api/api_recipes.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_recipe_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_user_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/favorite_entity.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/order_enum.dart';
import 'package:app_receitas/src/feactures/favorite/domain/mappers/favorite_mapper.dart';
import 'package:app_receitas/src/feactures/favorite/domain/mappers/favorite_recipe_mapper.dart';
import 'package:app_receitas/src/feactures/favorite/domain/mappers/favorite_user_mapper.dart';
import 'package:app_receitas/src/feactures/favorite/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImp extends FavoriteRepository {
  final FavoriteMapper _mapper;
  final ApiRecipes _apiRecipes;

  FavoriteRepositoryImp(this._mapper, this._apiRecipes);

  String path = 'favorite';

  @override
  Future<FavoriteEntity> addFavorite(FavoriteDto favoriteDto) async {
    final result = await _apiRecipes.post(
      path: '/$path}',
      body: _mapper.toJsonDto(favoriteDto),
    );

    return _mapper.fromJson(result);
  }

  @override
  Future<List<FavoriteUserDto>> getFavorites({
    required OrderFavoriteEnum orderBy,
    required int page,
    String? search,
  }) async {
    final result = await _apiRecipes.get(
      path:
          '/$path?sort=${orderBy.name}&isDesc=${orderBy.isDesc}&page=$page${search != null && search.isNotEmpty ? '&search=$search' : ''}',
    );

    print(result);

    return (result as List)
        .map((e) => FavoriteUserMapper().fromJson(e))
        .toList();
  }

  @override
  Future<void> removeFavorite(String favoriteId) async {
    await _apiRecipes.delete(path: '/$path/$favoriteId');
  }

  @override
  Future<FavoriteRecipeDto> getFavoriteRecipe(String recipeId) async {
    final result = await _apiRecipes.get(path: '/$path/recipe/$recipeId');

    return FavoriteRecipeMapper.fromJson(result);
  }
}
