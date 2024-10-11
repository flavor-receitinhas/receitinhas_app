import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/login_page.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseAuthPage extends StatefulWidget {
  static const route = '/choose-auth';

  const ChooseAuthPage({super.key});

  @override
  State<ChooseAuthPage> createState() => _ChooseAuthPageState();
}

class _ChooseAuthPageState extends State<ChooseAuthPage> {
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
    return CustomScreen(
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
            text: AppLocalizations.of(context)!.chooseAuthTitle,
            typography: CookieTypography.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          CookieText(
            text: AppLocalizations.of(context)!.chooseAuthBody,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bottomBar: [
        CookieButton.outline(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          label: AppLocalizations.of(context)!.chooseAuthRegisterButton,
          labelColor: Theme.of(context).colorScheme.primary,
          onPressed: () => Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const RegisterPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        CookieButton(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          label: AppLocalizations.of(context)!.chooseAuthLoginButton,
          onPressed: () => Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const LoginPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          ),
          width: MediaQuery.sizeOf(context).width,
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
