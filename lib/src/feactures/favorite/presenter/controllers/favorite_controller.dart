import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_user_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/order_enum.dart';
import 'package:app_receitas/src/feactures/favorite/domain/repositories/favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class FavoriteController extends ManagerStore {
  final FavoriteRepository _repository;

  FavoriteController(this._repository);

  List<FavoriteUserDto> listFavorite = [];
  var order = OrderFavoriteEnum.createdAtAsc;

  final favoriteController = TextEditingController();
  final pageSize = 25;

  final ScrollController scrollController = ScrollController();
  bool hasMore = true;
  bool isLoading = false;
  bool isLoadingSearch = false;
  int page = 0;

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          await _loadMoreItems();
          _setupScrollController();
        },
      );

  Future<List<FavoriteUserDto>> listFavoriteRecipes(
      {required OrderFavoriteEnum orderBy,
      required int page,
      String? search}) async {
    return await _repository.getFavorites(
      orderBy: orderBy,
      page: page,
      search: search,
    );
  }

  void _setupScrollController() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isLoading) {
        await _loadMoreItems();
      }
    });
  }

  Future<void> _loadMoreItems() async {
    if (!hasMore || isLoading) return;

    isLoading = true;
    final result = await listFavoriteRecipes(
      orderBy: order,
      page: page,
      search: favoriteController.text,
    );
    if (result.length < pageSize) {
      hasMore = false;
    } else {
      page++;
    }

    listFavorite.addAll(result);

    isLoading = false;
    notifyListeners();
  }

  Future<void> addFavorite(FavoriteDto favorite) async {
    await _repository.addFavorite(favorite);
    notifyListeners();
  }

  Future<void> removeFavorite(String favoriteId) async {
    await _repository.removeFavorite(favoriteId);
    notifyListeners();
  }

  Future<void> refreshList() async {
    isLoadingSearch = true;
    page = 0;
    hasMore = true;
    isLoading = false;
    listFavorite.clear();
    await _loadMoreItems();
    isLoadingSearch = false;
    notifyListeners();
  }

  Future<void> refreshPage() => handleTry(
        call: () async {
          isLoadingSearch = true;
          page = 0;
          order = OrderFavoriteEnum.createdAtAsc;
          favoriteController.clear();
          hasMore = true;
          isLoading = false;
          listFavorite.clear();
          await _loadMoreItems();
          isLoadingSearch = false;
        },
      );
}
