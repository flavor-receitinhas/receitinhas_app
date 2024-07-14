import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/favorite_entity.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/order_enum.dart';
import 'package:app_receitas/src/feactures/favorite/domain/repositories/favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_manager/export_manager.dart';

class FavoriteController extends ManagerStore {
  final FavoriteRepository _repository;

  FavoriteController(this._repository);

  List<FavoriteEntity> listFavorite = [];
  var order = OrderEnum.createdAtAsc;
  final PagingController<int, FavoriteEntity> pagingController =
      PagingController(firstPageKey: 0);
  final favoriteController = TextEditingController();
  final _pageSize = 25;

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          // await listFavoriteRecipes(orderDefault);
          //TODO Ele primeiro pegar a ordem default da lista, ou pegar de um banco de dados local qual salvou
          pagingController.addPageRequestListener(_fetch);
        },
      );

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  Future<List<FavoriteEntity>> listFavoriteRecipes(
      {required OrderEnum orderBy, required int page, String? search}) async {
    state = StateManager.loading;
    return await _repository.getFavorites(
        orderBy: orderBy, page: page, search: search);
  }

  Future<void> addFavorite(FavoriteDto favorite) async {
    await _repository.addFavorite(favorite);
    notifyListeners();
  }

  Future<void> removeFavorite(String userId, String recipeId) async {
    await _repository.removeFavorite(userId, recipeId);
    notifyListeners();
  }

  Future<void> _fetch(int pageKey) => handleTry(
        call: () async {
          if (pageKey == 0) {
            state = StateManager.loading;
          }
          final result = await listFavoriteRecipes(
            orderBy: order,
            page: pageKey,
            search: favoriteController.text,
          );

          final isLastPage = result.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(result);
          } else {
            pagingController.appendPage(result, ++pageKey);
          }
        },
        setError: (e) {
          pagingController.error = e;
        },
      );

  void refreshPage() {
    pagingController.notifyListeners();
    pagingController.refresh();
    state = StateManager.done;
  }
}
