import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/services/preference/sembast/sembast_database.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/welcome_page.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/controller/onboarding_controller.dart';

import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  final Preference _preference;
  final AuthService _authService;

  SplashController(
    this._preference,
    this._authService,
  );

  bool isLogged = false;
  String route = WelcomePage.route;

  Future<void> init() async {
    await loadDependences();

    notifyListeners();
  }

  Future<bool> readLoadingUser() async {
    return await _preference.get<bool>(keyPreferences: KeyPreferences.isLogged);
  }

  Future<void> loadDependences() async {
    try {
      await di.get<PersistentDatabaseSembast>().starting();
      await di.get<ThemeService>().init();
      await di.get<OnBoardingController>().init();
      isLogged = await readLoadingUser();
      if (isLogged) {
        await _authService.refreshToken();
        route = CustomBottomBar.route;
      }
    } catch (e) {
      print(e);
    }
  }
}
