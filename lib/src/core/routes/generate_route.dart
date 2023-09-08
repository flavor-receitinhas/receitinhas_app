import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/choose_auth_page.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/login_page.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/register_page.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/welcome_page.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/home_page.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/onboarding_page.dart';
import 'package:app_receitas/src/feactures/splash/presenter/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  Route<dynamic>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
          settings: settings,
        );
      case WelcomePage.route:
        return MaterialPageRoute(
          builder: (context) => const WelcomePage(),
          settings: settings,
        );
      case ChooseAuthPage.route:
        return MaterialPageRoute(
          builder: (context) => const ChooseAuthPage(),
          settings: settings,
        );
      case RegisterPage.route:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
          settings: settings,
        );
      case LoginPage.route:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
          settings: settings,
        );
      case OnBoardingPage.route:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingPage(),
          settings: settings,
        );

      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Text('ERRO'),
          settings: settings,
        );
    }
  }
}
