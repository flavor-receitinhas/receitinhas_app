import 'package:app_receitas/src/core/global/global_variables.dart'; 
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/pages/choose_auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomePage extends StatefulWidget {
  static const route = '/welcome';
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final ThemeService _themeController = di();

  @override
  void initState() {
    _themeController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: CustomScreen(
        iconAppBar: IconButton(
          onPressed: _themeController.saveThemePref,
          icon: Icon(
            _themeController.isThemeLight ? Icons.light_mode : Icons.dark_mode,
          ),
          iconSize: 36,
        ),
        body: Column(
          children: [
            CookieText(
              text: AppLocalizations.of(context)!.welcomeTitle,
              typography: CookieTypography.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            CookieText(
              text: AppLocalizations.of(context)!.welcomeBody,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        bottomBar: [
          CookieButton(
            label: AppLocalizations.of(context)!.welcomeBottomAppBar,
            onPressed: () => Navigator.pushNamed(context, ChooseAuthPage.route),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
