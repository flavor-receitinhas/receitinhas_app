import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_user_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/order_enum.dart';
import 'package:app_receitas/src/feactures/favorite/domain/repositories/favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_manager/export_manager.dart';

class FavoriteController extends ChangeNotifier {
  final FavoriteRepository _repository;

  FavoriteController(this._repository);

  List<FavoriteUserDto> listFavorite = [];
  var order = OrderFavoriteEnum.createdAtAsc;
  final PagingController<int, FavoriteUserDto> pagingController =
      PagingController(firstPageKey: 0);
  final favoriteController = TextEditingController();
  final _pageSize = 25;
  StateManager state = StateManager.loading;

  void init() {
    pagingController.addPageRequestListener(_fetch);

    state = StateManager.done;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    pagingController.dispose();
  }

  Future<List<FavoriteUserDto>> listFavoriteRecipes(
      {required OrderFavoriteEnum orderBy,
      required int page,
      String? search}) async {
    state = StateManager.loading;
    return await _repository.getFavorites(
      orderBy: orderBy,
      page: page,
      search: search,
    );
  }

  Future<void> addFavorite(FavoriteDto favorite) async {
    await _repository.addFavorite(favorite);
    notifyListeners();
  }

  Future<void> removeFavorite(String favoriteId) async {
    await _repository.removeFavorite(favoriteId);
    notifyListeners();
  }

  Future<void> _fetch(int pageKey) async {
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
  }

  void refreshPage() {
    pagingController.notifyListeners();
    pagingController.refresh();
    state = StateManager.done;
  }
}
