import 'dart:ui';
import 'package:app_receitas/src/core/services/language/language_controller.dart';
import 'package:app_receitas/src/core/services/preference/sembast/sembast_database.dart';
import 'package:app_receitas/src/core/services/preference/sembast/store_sembast_enum.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:page_manager/manager_store.dart';

class ConfigController extends ManagerStore {
  final AuthService _authService;
  final ThemeService _theme;
  final LanguageController _languageController;
  final PersistentDatabaseSembast _persistentDatabaseSembast;

  ConfigController(
    this._authService,
    this._theme,
    this._persistentDatabaseSembast,
    this._languageController,
  );

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

  List<Locale> get listLanguages => _languageController.listLanguages();

  Future<void> saveLanguagePref({required Locale locale}) async {
    String lang = locale.languageCode;

    if (locale.countryCode == 'BR') {
      lang = 'pt';
    }
    print('$lang saved');
    await _languageController.saveLanguagePref(lang);
  }

  String formatLang(Locale locale) {
    return _languageController.formatLang(locale);
  }

  Future<void> changeTheme() async {
    await _theme.saveThemePref();
    darkTheme = !darkTheme;
    notifyListeners();
  }
}
