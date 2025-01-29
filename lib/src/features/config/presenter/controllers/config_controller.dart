import 'package:app_receitas/src/core/services/language/language_controller.dart';
import 'package:app_receitas/src/core/services/preference/sembast/sembast_database.dart';
import 'package:app_receitas/src/core/services/preference/sembast/store_sembast_enum.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/features/auth/domain/services/auth_serivce.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:page_manager/manager_store.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  List<Locale> get listLanguages => AppLocalizations.supportedLocales;

  Future<void> saveLanguagePref({required Locale locale}) async {
    String lang = locale.languageCode;

    if (locale.languageCode == 'pt' && locale.countryCode == 'BR') {
      lang = 'pt_BR';
    }
    await _languageController.saveLanguagePref(lang);
    notifyListeners();
  }

  String formatLang(BuildContext context, {required Locale locale}) {
    return _languageController.formatLang(locale, context);
  }

  Future<void> changeTheme() async {
    await _theme.saveThemePref();
    darkTheme = !darkTheme;
    notifyListeners();
  }
}
