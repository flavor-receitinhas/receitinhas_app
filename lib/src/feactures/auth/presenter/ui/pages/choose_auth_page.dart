import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/login_page.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseAuthPage extends StatelessWidget {
  static const route = '/choose-auth';

  const ChooseAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      iconAppBar: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.sunny),
      ),
      image:
          'https://media.discordapp.net/attachments/1071892919633576117/1139340986322014208/image.png?width=518&height=518',
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
          onPressed: () => Navigator.pushNamed(context, RegisterPage.route),
        ),
        const SizedBox(height: 10),
        CookieButton(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          label: AppLocalizations.of(context)!.chooseAuthLoginButton,
          onPressed: () => Navigator.pushNamed(context, LoginPage.route),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
