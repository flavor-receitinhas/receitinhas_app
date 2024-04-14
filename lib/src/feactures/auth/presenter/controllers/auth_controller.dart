import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService;

  AuthController(
    this._authService,
  );

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<bool> registerFirebase() async {
    try {
      await _authService.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }

  Future<bool> loginFirebase() async {
    try {
      await _authService.signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      return true;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  Future<void> forgetPassword() async {
    try {
      await _authService.forgetPassword(
        email: emailController.text.trim(),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<bool> loginGoogle() async {
    try {
      await _authService.signInGoogle();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
