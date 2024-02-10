import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/entities/user_food_pref_entity.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/repositories/user_food_pref_repository.dart';
import 'package:flutter/material.dart';

class OnBoardingController extends ChangeNotifier {
  final UserFoodPrefRepository _repository;
  final Preference _preference;

  OnBoardingController(this._preference, this._repository);

  PageController pageController = PageController();
  int currentPage = 0;
  List<Proteins> protein = [];
  List<DietaryRestrictions> dietaryRestriction = [];
  List<DifficultyRecipe> difficultyRecipe = [];
  TextEditingController userNameController = TextEditingController();

  Future<void> init() async {
    pageController = PageController(initialPage: 0);
    notifyListeners();
  }

  void onChangedPage(int value) {
    currentPage = value;
    notifyListeners();
  }

  Future<void> saveIsLogin() async {
    await _preference.put(
      keyPreferences: KeyPreferences.isLogged,
      value: true,
    );
    notifyListeners();
  }

  void creatFoodPref() {
    _repository.createUser(
      user: UserFoodPrefEntity(
        userId: '5',
        protein: protein,
        dietaryRestriction: dietaryRestriction,
        difficultyRecipe: difficultyRecipe,
        userName: userNameController.text.trim(),
      ),
    );
  }
}
