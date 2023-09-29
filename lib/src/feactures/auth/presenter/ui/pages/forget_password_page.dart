import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPasswordPage extends StatelessWidget {
  static const route = '/forget-password';
  const ForgetPasswordPage({super.key});

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
            text: AppLocalizations.of(context)!.forgetPasswordTitle,
            typography: CookieTypography.title,
          ),
          SizedBox(height: 10),
          CookieText(
            text: AppLocalizations.of(context)!.forgetPasswordBody,
          ),
          SizedBox(height: 20),
          CookieTextField(
            hintText: AppLocalizations.of(context)!.forgetPasswordHintFild,
            prefixIcon: Icon(Icons.person),
          ),
        ],
      ),
      bottomBar: [
        CookieButton(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          label: AppLocalizations.of(context)!.forgetPasswordButton,
          onPressed: () {},
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
