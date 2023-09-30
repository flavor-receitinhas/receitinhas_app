import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  final Preference _preference;

  bool isThemeLight = true;

  ThemeController(this._preference);

  Future<void> init() async {
    isThemeLight = await readThemePref();

    notifyListeners();
  }

  Future<bool> readThemePref() async {
    return await _preference.get<bool>(
      keyPreferences: KeyPreferences.isThemeLight,
    );
  }

  Future<void> saveThemePref() async {
    isThemeLight = !isThemeLight;
    await _preference.put(
      keyPreferences: KeyPreferences.isThemeLight,
      value: isThemeLight,
    );
    notifyListeners();
  }

  ThemeMode get chooseTheme => isThemeLight ? ThemeMode.light : ThemeMode.dark;
}
