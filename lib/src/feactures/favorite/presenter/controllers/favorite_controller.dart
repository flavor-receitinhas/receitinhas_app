import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/favorite_entity.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/order_enum.dart';
import 'package:app_receitas/src/feactures/favorite/domain/repositories/favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FavoriteController extends ChangeNotifier {
  final FavoriteRepository _repository;

  FavoriteController(this._repository);

  List<FavoriteEntity> listFavorite = [];
  var state = PageState.loading;
  var order = OrderEnum.createdAtAsc;
  final PagingController<int, FavoriteEntity> pagingController =
      PagingController(firstPageKey: 0);
  final favoriteController = TextEditingController();
  final _pageSize = 25;

  Future<void> init() async {
    // await listFavoriteRecipes(orderDefault);
    //TODO Ele primeiro pegar a ordem default da lista, ou pegar de um banco de dados local qual salvou
    pagingController.addPageRequestListener(_fetch);
    state = PageState.done;
    notifyListeners();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  Future<List<FavoriteEntity>> listFavoriteRecipes(
      {required OrderEnum orderBy, required int page, String? search}) async {
    state = PageState.loading;
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

  Future<void> _fetch(int pageKey) async {
    try {
      if (pageKey == 0) {
        state = PageState.loading;
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

      state = PageState.done;
    } on Exception catch (e) {
      pagingController.error = e;
      state = PageState.error;
      rethrow;
    }
  }

  void refreshPage() {
    pagingController.notifyListeners();
    pagingController.refresh();
    state = PageState.done;
  }
}
