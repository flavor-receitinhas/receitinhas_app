import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/welcome',
      onGenerateRoute: (settings) {
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
      },
    );
  }
}
