import 'package:domain_receitinhas/core/global/global_variables.dart';
import 'package:domain_receitinhas/features/onboarding/domain/entities/user_food_pref_entity.dart';
import 'package:domain_receitinhas/features/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:domain_receitinhas/features/onboarding/domain/enums/proteins_enum.dart';
import 'package:domain_receitinhas/features/onboarding/domain/repositories/user_onboarding_repository.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class EditAccountController extends ManagerStore {
  final UserOnboardingRepository _onBoardingRepository;

  EditAccountController(this._onBoardingRepository);

  TextEditingController userNameController = TextEditingController();
  final List<Proteins> selectProteins = [];
  final List<DietaryRestrictions> selectRestriction = [];
  UserFoodPrefEntity? userPref;

  Map<String, dynamic> currentArguments = {};

  @override
  Future<void> init(Map<String, dynamic> arguments) => handleTry(
    call: () async {
      currentArguments = arguments;
      userNameController.text = Global.profile?.name ?? '';
      await loadingOnBoardingPrefs();
    },
  );

  Future<void> loadingOnBoardingPrefs() async {
    userPref = await _onBoardingRepository.getUserPref(userId: Global.user!.id);
    for (var e in userPref!.protein) {
      selectProteins.add(e);
    }
    for (var e in userPref!.dietaryRestriction) {
      selectRestriction.add(e);
    }
    notifyListeners();
  }

  Future<void> updateOnBoarding() async {
    await _onBoardingRepository.updateUserPref(
      user: UserFoodPrefEntity(
        userId: userPref!.userId,
        dietaryRestriction: selectRestriction,
        difficultyRecipe: userPref!.difficultyRecipe,
        protein: selectProteins,
      ),
    );
  }
}
