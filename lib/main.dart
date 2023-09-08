import 'package:app_receitas/src/core/inject/inject.dart';
import 'package:app_receitas/src/core/routes/generate_route.dart';
import 'package:app_receitas/src/core/themes/custom_theme.dart';
import 'package:app_receitas/src/core/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Inject.inicialize();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeController theme = ThemeController();
  @override
  void initState() {
    if (mounted) {
      theme.init();
      theme.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Receitas',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: theme.chooseTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('pt', 'BR'),
      initialRoute: '/splash',
      onGenerateRoute: GenerateRoute().onGenerate,
    );
  }
}
