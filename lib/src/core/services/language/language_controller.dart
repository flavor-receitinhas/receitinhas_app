import 'dart:developer';
import 'dart:ui' as ui;
import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/l10n/l10n.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class LanguageController extends ChangeNotifier {
  final Preference _preference;
  dynamic _currentLanguage;

  LanguageController(this._preference);

  Future<void> init() async {
    final String? lang = await _preference.get<String?>(
      keyPreferences: KeyPreferences.language,
    );
    if (lang == null || lang.isEmpty) {
      _currentLanguage = _getDeviceLanguage();
    } else {
      _currentLanguage = lang;
    }
    Global.language = _currentLanguage ?? 'pt';
    notifyListeners();
  }

  String formatLang(Locale locale, BuildContext context) {
    switch (locale.toString()) {
      case 'en':
        return AppLocalizations.of(context)!.languageEnglish;
      case 'es':
        return AppLocalizations.of(context)!.languageSpanish;
      case 'pt':
        return AppLocalizations.of(context)!.languagePortuguese;
      default:
        return AppLocalizations.of(context)!.languagePortuguese;
    }
  }

  String _getDeviceLanguage() {
    final deviceLocale = ui.PlatformDispatcher.instance.locale;
    final deviceLanguageCode = deviceLocale.languageCode;

    log('Device language code: $deviceLanguageCode');

    final supportedLanguages =
        L10n.all.map((locale) => locale.languageCode).toList();

    if (supportedLanguages.contains(deviceLanguageCode)) {
      return deviceLanguageCode;
    }

    return 'en';
  }

  Future<void> saveLanguagePref(String lang) async {
    _currentLanguage = lang;
    await _preference.put(value: lang, keyPreferences: KeyPreferences.language);
    Global.language = lang;
    notifyListeners();
  }

  Locale get currentLocale {
    final languageLocaleMap = {
      'en': Locale('en', 'US'),
      'es': Locale('es', 'ES'),
      'pt': Locale('pt', 'PT'),
    };
    notifyListeners();
    return languageLocaleMap[_currentLanguage] ?? Locale('pt', '');
  }
}
