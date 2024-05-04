import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/favorite_entity.dart';

abstract class FavoriteRepository {
  Future<void> addFavorite(FavoriteDto favoriteDto);
  Future<void> removeFavorite(String userId, String recipeId);
  Future<List<FavoriteEntity>> getFavorites(String orderBy);
}