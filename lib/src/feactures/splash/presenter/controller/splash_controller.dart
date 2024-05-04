import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/services/preference/sembast/sembast_database.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/welcome_page.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/custom_bottom_bar.dart';

import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  final AuthService _authService;

  SplashController(
    this._authService,
  );

  String route = WelcomePage.route;

  Future<void> init() async {
    await loadDependences();
    notifyListeners();
  }

  Future<void> loadDependences() async {
    await di.get<PersistentDatabaseSembast>().starting();
    await di.get<ThemeService>().init();
    if (await _authService.isLogged()) {
      await _authService.refreshToken();
      route = CustomBottomBar.route;
    }
  }
}
