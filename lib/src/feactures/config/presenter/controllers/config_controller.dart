import 'package:app_receitas/src/core/services/preference/sembast/sembast_database.dart';
import 'package:app_receitas/src/core/services/preference/sembast/store_sembast_enum.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:flutter/foundation.dart';

class ConfigController extends ChangeNotifier {
  final AuthService _authService;
  final ThemeService _theme;
  final PersistentDatabaseSembast _persistentDatabaseSembast;

  ConfigController(
      this._authService, this._theme, this._persistentDatabaseSembast);

  bool darkTheme = false;

  Future<void> init() async {
    await _theme.init();
    darkTheme = _theme.isThemeLight;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    _persistentDatabaseSembast.deleteAll(
        store: StoreSembastEnum.userPreference);
    notifyListeners();
  }

  Future<void> changeTheme() async {
    await _theme.saveThemePref();
    darkTheme = !darkTheme;
    notifyListeners();
  }
}
