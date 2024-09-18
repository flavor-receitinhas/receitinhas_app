import 'package:app_receitas/src/core/services/preference/sembast/sembast_database.dart';
import 'package:app_receitas/src/core/services/preference/sembast/store_sembast_enum.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:page_manager/manager_store.dart';

class ConfigController extends ManagerStore {
  final AuthService _authService;
  final ThemeService _theme;
  final PersistentDatabaseSembast _persistentDatabaseSembast;

  ConfigController(
      this._authService, this._theme, this._persistentDatabaseSembast);

  bool darkTheme = false;
  PackageInfo? packageInfo;

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          await _theme.init();
          packageInfo = await PackageInfo.fromPlatform();
          darkTheme = _theme.isThemeLight;
        },
      );

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
