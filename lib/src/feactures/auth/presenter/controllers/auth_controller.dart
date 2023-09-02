import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:flutter/material.dart';

class AuthController {
  final AuthService _authService;

  AuthController(
    this._authService,
  );

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<bool> registerFirebase() async {
    try {
      await _authService.singUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<bool> loginFirebase() async {
    try {
      await _authService.singIn(
          email: emailController.text, password: passwordController.text);
      return true;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }
}
