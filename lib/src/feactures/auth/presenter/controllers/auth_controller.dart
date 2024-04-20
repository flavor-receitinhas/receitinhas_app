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
    await _authService.signUp(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    return true;
  }

  Future<bool> loginFirebase() async {
    await _authService.signIn(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    return true;
  }

  Future<void> forgetPassword() async {
    await _authService.forgetPassword(
      email: emailController.text.trim(),
    );
  }

  Future<bool> loginGoogle() async {
    await _authService.signInGoogle();
    return true;
  }
}
