import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      iconAppBar: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
      sideAppBar: MainAxisAlignment.start,
      image:
          'https://media.discordapp.net/attachments/1071892919633576117/1139752601982873670/image.png?width=550&height=475',
      backgroundImage: '',
      body: Column(
        children: [
          CookieText(
            text: AppLocalizations.of(context)!.loginTitle,
            typography: CookieTypography.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          CookieText(
            text: AppLocalizations.of(context)!.loginBody,
            typography: CookieTypography.body,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          CookieTextField(
            hintText: AppLocalizations.of(context)!.loginEmail,
            prefixIcon: const Icon(Icons.person),
          ),
          const SizedBox(height: 10),
          CookieTextField(
            hintText: AppLocalizations.of(context)!.loginPassword,
            prefixIcon: const Icon(Icons.lock_outline_rounded),
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomBar: [
        CookieButton(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          label: AppLocalizations.of(context)!.loginButton,
          onPressed: () {},
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
