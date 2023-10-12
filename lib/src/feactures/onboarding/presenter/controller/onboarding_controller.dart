import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/model/user_preference_entity.dart';
import 'package:flutter/material.dart';

class OnBoardingController extends ChangeNotifier {
  final Preference _preference;

  OnBoardingController(this._preference);

   PageController pageController = PageController();
  int currentPage = 0;
   UserPreferenceEntity onboardingPref = UserPreferenceEntity();

  Future<void> init() async {
    pageController = PageController(initialPage: 0);
    onboardingPref = await loadingOnboardingPrefs();
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

  Future<UserPreferenceEntity> loadingOnboardingPrefs() async {
    final pref = await _preference.get<Map<String, dynamic>?>(
      keyPreferences: KeyPreferences.onBoardingPref,
    );
    if (pref == null) {
      return UserPreferenceEntity();
    } else {
      return UserPreferenceEntity.fromMap(pref);
    }
  }

  Future<void> saveOnboardingPrefs() async {
    await _preference.put(
      keyPreferences: KeyPreferences.onBoardingPref,
      value: onboardingPref.toMap(),
    );
    notifyListeners();
  }
}
