import 'package:app_receitas/src/features/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/features/recipes/domain/enum/order_recipe_enum.dart';
import 'package:app_receitas/src/features/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/entities/state_manager.dart';

class ResearchController extends ChangeNotifier {
  final RecipeRepository _recipeRepository;

  ResearchController(
    this._recipeRepository,
  );

  List<RecipeDto> recipes = [];
  final _pageSize = 25;
  int _currentPage = 0;
  bool _hasReachedMax = false;
  bool _isLoadingMore = false;
  bool _hasError = false;

  StateManager state = StateManager.loading;
  final searchController = TextEditingController();
  bool isDesc = true;
  OrderRecipeEnum? orderBy;
  int? timePreparedTo;
  int? timePreparedFrom;
  int? portionTo;
  int? portionFrom;
  String? difficultyRecipe;

  bool get isLoading => state == StateManager.loading;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasError => _hasError;
  bool get hasReachedMax => _hasReachedMax;

  Future<void> init() async {
    await loadRecipes();
  }

  Future<void> loadRecipes({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 0;
      _hasReachedMax = false;
      recipes.clear();
      state = StateManager.loading;
      _hasError = false;
    }

    try {
      final result = await listRecipe(page: _currentPage);

      if (refresh) {
        recipes = result;
      } else {
        recipes.addAll(result);
      }

      _hasReachedMax = result.length < _pageSize;
      _currentPage++;
      state = StateManager.done;
      _hasError = false;
    } catch (e) {
      _hasError = true;
      state = StateManager.done;
    }

    notifyListeners();
  }

  Future<void> loadMoreRecipes() async {
    if (_isLoadingMore || _hasReachedMax || _hasError) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      final result = await listRecipe(page: _currentPage);
      recipes.addAll(result);
      _hasReachedMax = result.length < _pageSize;
      _currentPage++;
      _hasError = false;
    } catch (e) {
      _hasError = true;
    }

    _isLoadingMore = false;
    notifyListeners();
  }

  Future<List<RecipeDto>> listRecipe({
    required int page,
  }) async {
    return await _recipeRepository.listRecipe(
      search: searchController.text,
      page: page,
      isDesc: isDesc,
      orderBy: orderBy,
      timePreparedTo: timePreparedTo,
      timePreparedFrom: timePreparedFrom,
      portionTo: portionTo,
      portionFrom: portionFrom,
      difficultyRecipe: difficultyRecipe,
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

  void refreshPage() {
    loadRecipes(refresh: true);
  }

  void clearFilters() {
    isDesc = true;
    orderBy = null;
    timePreparedTo = null;
    timePreparedFrom = null;
    portionTo = null;
    portionFrom = null;
    difficultyRecipe = null;
    refreshPage();
  }
}
