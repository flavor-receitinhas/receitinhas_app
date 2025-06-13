import 'package:app_receitas/src/features/recipes/domain/entities/ingredient_entity.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/features/recipes/domain/enum/unit_enum.dart';
import 'package:app_receitas/src/features/recipes/domain/repositories/ingredient_repository.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class IngredientSelectController extends ManagerStore {
  final IngredientRepository _ingredientRepository;

  IngredientSelectController(this._ingredientRepository);

  List<IngredientEntity> ingredients = [];
  final _pageSize = 25;
  int _currentPage = 0;
  bool _hasReachedMax = false;
  bool _isLoadingMore = false;
  bool _hasError = false;

  final ingredientController = TextEditingController();
  List<IngredientRecipeEntity> listIngredientSelect = [];
  final TextEditingController quantityController = TextEditingController();
  UnitEnum? unit;

  bool get isLoading => state == StateManager.loading;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasError => _hasError;
  bool get hasReachedMax => _hasReachedMax;

  @override
  void init(Map<String, dynamic> arguments) {
    handleTry(
      call: () async {
        arguments['ingredients'] != null
            ? listIngredientSelect = arguments['ingredients']
            : listIngredientSelect = [];
        await loadIngredients();
      },
    );
  }

  Future<void> loadIngredients({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 0;
      _hasReachedMax = false;
      ingredients.clear();
      state = StateManager.loading;
      _hasError = false;
    }

    try {
      final result = await _ingredientRepository.listIngredient(
        name: ingredientController.text,
        page: _currentPage,
      );

      if (refresh) {
        ingredients = result;
      } else {
        ingredients.addAll(result);
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

  Future<void> loadMoreIngredients() async {
    if (_isLoadingMore || _hasReachedMax || _hasError) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      final result = await _ingredientRepository.listIngredient(
        name: ingredientController.text,
        page: _currentPage,
      );
      ingredients.addAll(result);
      _hasReachedMax = result.length < _pageSize;
      _currentPage++;
      _hasError = false;
    } catch (e) {
      _hasError = true;
    }

    _isLoadingMore = false;
    notifyListeners();
  }

  Future<void> addIngredient() async {
    handleTry(
      call: () async {
        await _ingredientRepository.createIngredient(ingredientController.text);
      },
      showDialogError: true,
      onCatch: StateManager.done,
    );
  }

  void refreshPage() {
    loadIngredients(refresh: true);
  }

  void decreaseQuantity() {
    final result = int.parse(quantityController.text);
    quantityController.text = result > 0 ? (result - 1).toString() : '0';
    notifyListeners();
  }

  void increaseQuantity() {
    final result = int.tryParse(quantityController.text);
    quantityController.text = result == null ? '1' : (result + 1).toString();
    notifyListeners();
  }

  void addIngredientSelect(IngredientEntity ingredient) {
    final ingredientSelect = IngredientRecipeEntity(
      ingredient: ingredient,
      quantity: double.parse(quantityController.text),
      unit: unit!.name,
    );
    listIngredientSelect.add(ingredientSelect);
    notifyListeners();
  }

  void deleteIngredientSelect(IngredientRecipeEntity ingredient) {
    listIngredientSelect.remove(ingredient);
    notifyListeners();
  }
}
