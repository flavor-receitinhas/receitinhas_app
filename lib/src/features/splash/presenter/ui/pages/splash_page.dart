import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/splash/presenter/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class SplashPage extends StatefulWidget {
  static const route = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashController ct = di();
  @override
  void initState() {
    ct.addListener(() {
      setState(() {});
    });
    if (mounted) {
      ct.init().then(
            (value) => Navigator.pushNamedAndRemoveUntil(
              context,
              ct.route,
              (route) => false,
            ),
          );
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              radius: 110,
              child: Image.asset(
                "assets/images/logo.png",
                scale: 3,
              ),
            ),
          ),
          Spacer(),
          CookieText(
            text: AppLocalizations.of(context)!.splashLoading,
          ),
        ],
      ),
    );
  }
}
