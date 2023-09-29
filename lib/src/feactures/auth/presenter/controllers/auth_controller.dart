import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService;
  final Preference _preference;

  AuthController(
    this._authService,
    this._preference,
  );

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> saveIsLogin() async {
    await _preference.put(
      keyPreferences: KeyPreferences.isLogged,
      value: true,
    );
    notifyListeners();
  }

  Future<bool> registerFirebase() async {
    try {
      await _authService.singUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      await saveIsLogin();
      return true;
    } catch (e) {
      print(e);

    return false;
    }
  }

  Future<bool> loginFirebase() async {
    try {
      await _authService.singIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      await saveIsLogin();
      return true;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }
}
