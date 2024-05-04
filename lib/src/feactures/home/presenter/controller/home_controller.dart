import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/repositories/user_omboarding_repository.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/onboarding_page.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final UserOmboardingRepository _userFoodPrefRepository;
  final ProfileRepository _profileRepository;

  HomeController(this._recipeRepository, this._userFoodPrefRepository,
      this._profileRepository);

  PageState state = PageState.loading;
  PageController pageController = PageController();
  int indexPage = 0;

  Future<void> init(BuildContext context) async {
    await verifyOnboading().then((value) =>
        value ? Navigator.pushNamed(context, OnBoardingPage.route) : null);
    await loadingProfile();
    state = PageState.done;
    notifyListeners();
  }

  Future<void> listRecipe() async {
    await _recipeRepository.listRecipe();
  }

  Future<void> loadingProfile() async {
    Global.profile = await _profileRepository.getProfile(Global.user!.id);
    notifyListeners();
  }

  void changePage(int page) {
    pageController.jumpToPage(page);
    indexPage = page;
    notifyListeners();
  }

  Future<bool> verifyOnboading() async {
    final result =
        await _userFoodPrefRepository.getUserPref(userId: Global.user!.id);
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
