import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_recipe_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_user_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/favorite_entity.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/order_enum.dart';

abstract class FavoriteRepository {
  Future<FavoriteEntity> addFavorite(FavoriteDto favoriteDto);
  Future<void> removeFavorite(String favoriteId);
  Future<List<FavoriteUserDto>> getFavorites({
    required OrderFavoriteEnum orderBy,
    required int page,
    String? search,
  });
  Future<FavoriteRecipeDto> getFavoriteRecipe(String recipeId);
}
