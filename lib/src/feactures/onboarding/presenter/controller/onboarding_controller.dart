import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:flutter/material.dart';

class OnBoardingController extends ChangeNotifier {
  final Preference _preference;

  OnBoardingController(this._preference);

  late PageController pageController;
  int currentPage = 0;

  void init() {
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
}
