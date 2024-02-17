import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:flutter/foundation.dart';

class ConfigController extends ChangeNotifier {
  final AuthService _authService;
  final ThemeService _theme;

  ConfigController(this._authService, this._theme);

  bool darkTheme = false;

  Future<void> init() async {
    await _theme.init();
    darkTheme = _theme.isThemeLight;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    notifyListeners();
  }

  Future<void> changeTheme() async {
    await _theme.saveThemePref();
    darkTheme = !darkTheme;
    notifyListeners();
  }
}
