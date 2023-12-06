import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:flutter/foundation.dart';

class ConfigController extends ChangeNotifier {
  final AuthService _authService;
  final Preference _preference;

  ConfigController(this._authService, this._preference);

  Future<void> logout() async {
    await _authService.logout();
    await _preference.put(
      keyPreferences: KeyPreferences.isLogged,
      value: false,
    );
    notifyListeners();
  }
}
