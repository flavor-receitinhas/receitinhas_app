import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/ingredient_repository.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_manager/export_manager.dart';

class IngredientSelectController extends ManagerStore {
  final IngredientRepository _ingredientRepository;

  IngredientSelectController(this._ingredientRepository);

  final PagingController<int, IngredientEntity> pagingController =
      PagingController(firstPageKey: 0);
  final _pageSize = 25;
  final ingredientController = TextEditingController();
  final List<IngredientRecipeEntity> listIngredientSelect = [];

  @override
  void init(Map<String, dynamic> arguments) {
    handleTry(
      call: () async {
        pagingController.addPageRequestListener(_fetch);
      },
    );
  }

  Future<List<IngredientEntity>> ingredients(
      {required int page, String? name}) async {
    return await _ingredientRepository.listIngredient(name: name, page: page);
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

  @override
  void dispose() {
    super.dispose();
    pagingController.dispose();
  }

  Future<void> _fetch(int pageKey) async {
    if (pageKey == 0) {
      //state = StateManager.loading;
    }
    final result = await ingredients(
      page: pageKey,
      name: ingredientController.text,
    );

    final isLastPage = result.length < _pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(result);
    } else {
      pagingController.appendPage(result, ++pageKey);
    }
    notifyListeners();
  }

  void refreshPage() {
    pagingController.notifyListeners();
    pagingController.refresh();
    state = StateManager.done;
  }
}
