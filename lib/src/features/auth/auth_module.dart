import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/features/auth/domain/services/auth_serivce.dart';
import 'package:app_receitas/src/features/auth/domain/services/auth_service_firebase.dart';
import 'package:app_receitas/src/features/auth/presenter/controllers/auth_controller.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/pages/choose_auth_page.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/pages/forget_password_page.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/pages/login_page.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/pages/register_page.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class AuthModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    ChooseAuthPage.route: const ChooseAuthPage(),
    ForgetPasswordPage.route: const ForgetPasswordPage(),
    LoginPage.route: const LoginPage(),
    RegisterPage.route: const RegisterPage(),
    WelcomePage.route: const WelcomePage(),
  };

  @override
  void inicialize() {
    //Service
    di.registerFactory<AuthService>(() => AuthServiceFirebase());

    //controller
    di.registerFactory<AuthController>(
      () => AuthController(
        di(),
      ),
    );
  }
}
