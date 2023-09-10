import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/services/preference/sembast/sembast_database.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/welcome_page.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  final Preference _preference;

  SplashController(
    this._preference,
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
      isLogged = await readLoadingUser();
      if (isLogged) {
        route = HomePage.route;
      }
    } catch (e) {
      print(e);
    }
  }
}
