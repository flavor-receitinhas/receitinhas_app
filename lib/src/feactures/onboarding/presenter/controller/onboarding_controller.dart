import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/model/onboard_pref_model.dart';
import 'package:flutter/material.dart';

class OnBoardingController extends ChangeNotifier {
  final Preference _preference;

  OnBoardingController(this._preference);

  late PageController pageController;
  int currentPage = 0;
  late OnboardingPrefModel onboardingPref;

  void init() async {
    pageController = PageController(initialPage: 0);
    await loadingOnboardingPrefs();
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

  Future<void> loadingOnboardingPrefs() async {
    final pref = await _preference.get<Map<String, dynamic>?>(
      keyPreferences: KeyPreferences.onBoardingPref,
    );
    if (pref == null) {
      onboardingPref = OnboardingPrefModel();
    } else {
      onboardingPref = OnboardingPrefModel.fromJson(pref);
    }
  }

  Future<void> saveOnboardingPrefs() async {
    await _preference.put(
      keyPreferences: KeyPreferences.onBoardingPref,
      value: onboardingPref.toJson(),
    );
    notifyListeners();
  }
}
