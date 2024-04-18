import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/entities/user_food_pref_entity.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/repositories/user_omboarding_repository.dart';
import 'package:flutter/material.dart';

class OnBoardingController extends ChangeNotifier {
  final UserOmboardingRepository _repository;
  final Preference _preference;

  OnBoardingController(this._repository, this._preference);

  PageController pageController = PageController();
  late int currentPage;
  List<Proteins> protein = [];
  List<DietaryRestrictions> dietaryRestriction = [];
  List<DifficultyRecipe> difficultyRecipe = [];
  TextEditingController userNameController = TextEditingController();

  Future<void> init() async {
    currentPage = await _preference.get<int>(
      keyPreferences: KeyPreferences.onBoardingLastPage,
    );
    pageController.animateToPage(
      currentPage,
      curve: Curves.linear,
      duration: Durations.short1,
    );

    notifyListeners();
  }

  Future<void> onChangedPage(int value) async {
    currentPage = value;
    await _preference.put(
      value: value,
      keyPreferences: KeyPreferences.onBoardingLastPage,
    );
    notifyListeners();
  }

  Future<void> updateFoodPref() async {
    await _repository.updateUserPref(
      user: UserFoodPrefEntity(
        userId: Global.user!.id,
        protein: protein,
        dietaryRestriction: dietaryRestriction,
        difficultyRecipe: difficultyRecipe,
      ),
    );
  }

  Future<void> updateNameProfile() {
    return _repository.updateUserName(
      userId: Global.user!.id,
      name: userNameController.text,
    );
  }

}
