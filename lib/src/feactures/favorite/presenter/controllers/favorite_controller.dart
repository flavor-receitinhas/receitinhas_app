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

  Future<void> init() async {
    listFavorite = await listFavoriteRecipes();
    state = PageState.done;
    notifyListeners();
  }

  Future<List<FavoriteEntity>> listFavoriteRecipes() async {
    return await _repository.getFavorites();
  }

  Future<void> addFavorite(FavoriteDto favorite) async {
    await _repository.addFavorite(favorite);
    listFavorite = await listFavoriteRecipes();
    notifyListeners();
  }

  Future<void> removeFavorite(String userId, String recipeId) async {
    await _repository.removeFavorite(userId, recipeId);
    listFavorite = await listFavoriteRecipes();
    notifyListeners();
  }
}
