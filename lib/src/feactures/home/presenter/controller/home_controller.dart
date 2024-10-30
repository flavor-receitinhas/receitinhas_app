import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/repositories/user_omboarding_repository.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:app_receitas/src/feactures/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/enum/order_recipe_enum.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class HomeController extends ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final UserOmboardingRepository _userFoodPrefRepository;
  final ProfileRepository _profileRepository;

  HomeController(this._recipeRepository, this._userFoodPrefRepository,
      this._profileRepository);

  List<RecipeDto> recipes = [];
  final int pageSize = 25;

  final ScrollController scrollController = ScrollController();
  bool? isDesc;
  OrderRecipeEnum? orderBy;
  int? timePreparedTo;
  int? timePreparedFrom;
  int? portionTo;
  int? portionFrom;
  List<DifficultyRecipe>? difficultyRecipe;
  StateManager state = StateManager.loading;
  bool isLoadingMore = false;
  int currentPage = 0;

  void init() async {
    await loadingProfile();
    _setupScrollController();
    await fetchRecipes();
    state = StateManager.done;
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isLoadingMore) {
        _loadMoreItems();
      }
    });
  }

  Future<void> fetchRecipes() async {
    final newRecipes = await _recipeRepository.listRecipe(page: currentPage);
    recipes.addAll(newRecipes);
    notifyListeners();
  }

  Future<void> _loadMoreItems() async {
    if (isLoadingMore) return;

    isLoadingMore = true;
    currentPage++;
    final newRecipes = await _recipeRepository.listRecipe(page: currentPage);
    recipes.addAll(newRecipes);
    isLoadingMore = false;
    notifyListeners();
  }

  Future<void> loadingProfile() async {
    Global.profile = await _profileRepository.getProfile(Global.user!.id);
    notifyListeners();
  }

  Future<bool> verifyOnboading() async {
    final result = await _userFoodPrefRepository.getUserPref(
      userId: Global.user!.id,
    );
    if (result.dietaryRestriction.isEmpty) {
      return true;
    }
    if (result.difficultyRecipe.isEmpty) {
      return true;
    }
    if (result.protein.isEmpty) {
      return true;
    }
    return false;
  }
}
