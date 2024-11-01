import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/services/api/api_recipes.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_recipe_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/favorite_entity.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/order_enum.dart';
import 'package:app_receitas/src/feactures/favorite/domain/mappers/favorite_mapper.dart';
import 'package:app_receitas/src/feactures/favorite/domain/mappers/favorite_recipe_mapper.dart';
import 'package:app_receitas/src/feactures/favorite/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImp extends FavoriteRepository {
  final FavoriteMapper _mapper;
  final ApiRecipes _apiRecipes;

  FavoriteRepositoryImp(this._mapper, this._apiRecipes);

  String path = 'favorite';

  @override
  Future<void> addFavorite(FavoriteDto favoriteDto) async {
    await _apiRecipes.post(
      path: '/$path/${favoriteDto.userId}',
      body: _mapper.toJsonDto(favoriteDto),
    );
  }

  @override
  Future<List<FavoriteEntity>> getFavorites({
    required OrderFavoriteEnum orderBy,
    required int page,
    String? search,
  }) async {
    final result = await _apiRecipes.get(
      path:
          '/$path/${Global.user!.id}?sort=${orderBy.name}&isDesc=${orderBy.isDesc}&page=$page${search != null && search.isNotEmpty ? '&search=$search' : ''}',
    );

    return (result as List).map((e) => _mapper.fromJson(e)).toList();
  }

  @override
  Future<void> removeFavorite(String userId, String recipeId) async {
    await _apiRecipes.delete(path: '/$path/$userId/$recipeId');
  }

  @override
  Future<FavoriteRecipeDto> getFavoriteRecipe(String recipeId) async {
    final result = await _apiRecipes.get(path: '/$path/recipe/$recipeId');

    return FavoriteRecipeMapper.fromJson(result);
  }
}
