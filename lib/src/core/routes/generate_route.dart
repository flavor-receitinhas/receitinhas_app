import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  Route<dynamic>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/welcome':
        return MaterialPageRoute(
          builder: (context) => const WelcomePage(),
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
