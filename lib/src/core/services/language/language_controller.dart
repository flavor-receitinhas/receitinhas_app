import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageController extends ChangeNotifier {
  final Preference _preference;
  dynamic _currentLanguage;

  LanguageController(this._preference);

  Future<void> init() async {
    final String? lang = await _preference.get<String?>(
      keyPreferences: KeyPreferences.language,
    );
    _currentLanguage = lang;
    notifyListeners();
  }

  List<Locale> listLanguages() {
    return AppLocalizations.supportedLocales;
  }

  String formatLang(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Espanish';
      case 'pt':
        if (locale.countryCode != null) {
          return 'Português-Brasileiro';
        }
        return 'Português-Portugal';
      default:
        return 'Português-Brasileiro';
    }
  }

  Future<void> saveLanguagePref(String lang) async {
    _currentLanguage = lang;
    await _preference.put(
      value: lang,
      keyPreferences: KeyPreferences.language,
    );
    notifyListeners();
  }

  Locale get currentLocale => Locale(_currentLanguage ?? 'pt_BR');
}
