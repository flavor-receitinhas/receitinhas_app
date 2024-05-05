import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/favorite_entity.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/order_enum.dart';
import 'package:app_receitas/src/feactures/favorite/domain/repositories/favorite_repository.dart';
import 'package:flutter/material.dart';

class FavoriteController extends ChangeNotifier {
  final FavoriteRepository _repository;

  FavoriteController(this._repository);

  List<FavoriteEntity> listFavorite = [];
  var state = PageState.loading;
  var orderDefault = OrderEnum.createdAtAsc;

  Future<void> init() async {
    await listFavoriteRecipes(orderDefault);
    state = PageState.done;
    notifyListeners();
  }

  Future<void> listFavoriteRecipes(OrderEnum order) async {
    state = PageState.loading;
    listFavorite = await _repository.getFavorites(order);
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
