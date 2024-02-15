import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:flutter/foundation.dart';

class ConfigController extends ChangeNotifier {
  final AuthService _authService;
  final Preference _preference;
  final ThemeService _theme;

  ConfigController(this._authService, this._preference, this._theme);

  bool darkTheme = false;

  Future<void> init() async {
    await _theme.init();
    darkTheme = _theme.isThemeLight;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    await _preference.put(
      keyPreferences: KeyPreferences.isLogged,
      value: false,
    );
    notifyListeners();
  }

  Future<void> changeTheme() async {
    await _theme.saveThemePref();
    darkTheme = !darkTheme;
    notifyListeners();
  }
}
