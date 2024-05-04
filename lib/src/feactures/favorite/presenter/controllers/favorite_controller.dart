import 'package:app_receitas/src/core/widgets/cookie_page.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/favorite_entity.dart';
import 'package:app_receitas/src/feactures/favorite/domain/repositories/favorite_repository.dart';
import 'package:flutter/material.dart';

class FavoriteController extends ChangeNotifier {
  final FavoriteRepository _repository;

  FavoriteController(this._repository);

  List<FavoriteEntity> listFavorite = [];
  var state = PageState.loading;
  var orderBy = 'createdAt';

  Future<void> init() async {
    await listFavoriteRecipes(orderBy);
    state = PageState.done;
    notifyListeners();
  }

  Future<void> listFavoriteRecipes(String orderBy) async {
    state = PageState.loading;
    listFavorite = await _repository.getFavorites(orderBy);
    state = PageState.done;
    notifyListeners();
  }

  Future<void> addFavorite(FavoriteDto favorite) async {
    await _repository.addFavorite(favorite);
    notifyListeners();
  }

  Future<void> removeFavorite(String userId, String recipeId) async {
    await _repository.removeFavorite(userId, recipeId);
    notifyListeners();
  }
}
