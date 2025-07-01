import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/features/onboarding/data/mappers/validate_user_entity.dart';
import 'package:app_receitas/src/features/onboarding/domain/entities/user_food_pref_entity.dart';
import 'package:app_receitas/src/features/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/features/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/features/onboarding/domain/enums/proteins_enum.dart';
import 'package:app_receitas/src/features/onboarding/domain/repositories/user_onboarding_repository.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/entities/state_manager.dart';

class OnBoardingController extends ChangeNotifier {
  final UserOnboardingRepository _repository;
  OnBoardingController(this._repository);

  PageController pageController = PageController();
  late int currentPage;
  List<Proteins> protein = [];
  List<DietaryRestrictions> dietaryRestriction = [];
  List<DifficultyRecipe> difficultyRecipe = [];
  TextEditingController userNameController = TextEditingController();
  StateManager stateValidateName = StateManager.initial;
  ValidateUserEntity? validateUserEntity;

  Future<void> init() async {
    pageController.animateToPage(
      currentPage,
      curve: Curves.linear,
      duration: Durations.short1,
    );

    notifyListeners();
  }

  Future<void> onChangedPage(int value) async {
    currentPage = value;

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
      name: userNameController.text.trim(),
    );
  }

  Future<void> validateUser() async {
    try {
      stateValidateName = StateManager.loading;
      validateUserEntity = await _repository.validateUser(
        userID: Global.user!.id,
        name: userNameController.text.trim(),
      );
      stateValidateName = StateManager.done;
    } catch (e) {
      stateValidateName = StateManager.error;
    }
    notifyListeners();
  }
}
