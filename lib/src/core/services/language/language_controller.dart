import 'dart:developer';

import 'package:app_receitas/src/core/global/global_variables.dart';
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
    _currentLanguage = lang;
    Global.language = lang ?? 'pt';
    log('LanguageController: $lang');
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
