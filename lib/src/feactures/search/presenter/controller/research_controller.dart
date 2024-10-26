import 'package:app_receitas/src/feactures/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/enum/order_recipe_enum.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_manager/entities/state_manager.dart';

class ResearchController extends ChangeNotifier {
  final RecipeRepository _recipeRepository;

  ResearchController(
    this._recipeRepository,
  );

  List<RecipeDto> recipes = [];

  final _pageSize = 25;
  StateManager state = StateManager.loading;
  final PagingController<int, RecipeDto> pagingController =
      PagingController(firstPageKey: 0);
  final searchController = TextEditingController();
  bool? isDesc;
  OrderRecipeEnum? orderBy;
  int? timePreparedTo;
  int? timePreparedFrom;
  int? portionTo;
  int? portionFrom;
  List<String>? difficultyRecipe;

  Future<void> init() async {
    pagingController.addPageRequestListener(_fetch);
    state = StateManager.done;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    pagingController.dispose();
  }

  Future<List<RecipeDto>> listRecipe({
    required int page,
  }) async {
    state = StateManager.loading;

    return await _recipeRepository.listRecipe(
      search: searchController.text,
      page: page,
      isDesc: isDesc,
      orderBy: orderBy,
      timePreparedTo: timePreparedTo,
      timePreparedFrom: timePreparedFrom,
      portionTo: portionTo,
      portionFrom: portionFrom,
      difficultyRecipe: difficultyRecipe?.map((e) => e).toList(),
    );
  }

  String formatTime(double value) {
    int totalMinutes = value.round();
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;

    if (hours > 0 && minutes > 0) {
      return '${hours}h ${minutes}m';
    } else if (hours > 0) {
      return '${hours}h';
    } else {
      return '${minutes}m';
    }
  }

  Future<void> _fetch(int pageKey) async {
    if (pageKey == 0) {
      state = StateManager.loading;
    }
    final result = await listRecipe(
      page: pageKey,
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

  void clearFilters() {
    isDesc = null;
    orderBy = null;
    timePreparedTo = null;
    timePreparedFrom = null;
    portionTo = null;
    portionFrom = null;
    difficultyRecipe = null;
    refreshPage();
  }
}
