import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/pages/login_page.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

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
      if (mounted) setState(() {});
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
          Image.asset(ImagesEnum.eggDuvida.path),
          Spacer(),
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
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          label: AppLocalizations.of(context)!.chooseAuthRegisterButton,
          labelColor: Theme.of(context).colorScheme.primary,
          onPressed: () => Navigator.pushNamed(context, RegisterPage.route),
        ),
        CookieButton(
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          label: AppLocalizations.of(context)!.chooseAuthLoginButton,
          onPressed: () => Navigator.pushNamed(context, LoginPage.route),
          width: MediaQuery.sizeOf(context).width,
        ),
      ],
    );
  }
}
