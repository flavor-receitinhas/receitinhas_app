import 'package:domain_receitinhas/core/global/global_variables.dart';
import 'package:domain_receitinhas/features/onboarding/domain/repositories/user_onboarding_repository.dart';
import 'package:domain_receitinhas/features/profile/domain/repositories/profile_repository.dart';
import 'package:domain_receitinhas/features/recipes/domain/dtos/recipe_dto.dart';
import 'package:domain_receitinhas/features/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class HomeController extends ManagerStore {
  final RecipeRepository _recipeRepository;
  final UserOnboardingRepository _userFoodPrefRepository;
  final ProfileRepository _profileRepository;

  HomeController(
    this._recipeRepository,
    this._userFoodPrefRepository,
    this._profileRepository,
  );

  List<RecipeDto> recipes = [];
  final int pageSize = 25;

  final ScrollController scrollController = ScrollController();

  bool hasMore = true;
  bool isLoading = false;
  int page = 0;

  @override
  Future<void> init(Map<String, dynamic> arguments) => handleTry(
    call: () async {
      await loadingProfile();
      await _loadMoreItems(true);
      _setupScrollController();
    },
  );

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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

  Future<List<RecipeDto>> getRecipes() async {
    final result = await _recipeRepository.listRecipe(page: page);
    return result;
  }

  Future<void> _loadMoreItems([bool refresh = false]) async {
    if (refresh == true) {
      recipes = [];
      page = 0;
      hasMore = true;
      isLoading = false;
    }

    if (!hasMore || isLoading) return;

    isLoading = true;
    final result = await getRecipes();
    if (result.length < pageSize) {
      hasMore = false;
    } else {
      page++;
    }

    recipes.addAll(result);

    isLoading = false;
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

  Future<void> refresh() => handleTry(
    call: () async {
      recipes = [];
      page = 0;
      hasMore = true;
      isLoading = false;
      await _loadMoreItems();
    },
  );
}
