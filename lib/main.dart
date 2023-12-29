import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/inject/inject.dart';
import 'package:app_receitas/src/core/routes/generate_route.dart';
import 'package:app_receitas/src/core/themes/custom_theme.dart';
import 'package:app_receitas/src/core/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GenerateRoute().registerRoutes();
  Inject.inicialize();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = di();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeController,
      builder: (context, _) {
        return MaterialApp(
          title: 'App Receitas',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: _themeController.chooseTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('pt', 'BR'),
          initialRoute: '/splash',
          onGenerateRoute: GenerateRoute().generateRoute,
        );
      },
    );
  }
}
