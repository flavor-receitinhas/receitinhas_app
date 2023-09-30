import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/auth/presenter/controllers/auth_controller.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPasswordPage extends StatefulWidget {
  static const route = '/forget-password';
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  AuthController ct = di();

  @override
  void dispose() {
    ct.dispose();
    super.dispose();
  }

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
          const SizedBox(height: 10),
          CookieText(
            text: AppLocalizations.of(context)!.forgetPasswordBody,
          ),
          const SizedBox(height: 20),
          CookieTextField(
            hintText: AppLocalizations.of(context)!.forgetPasswordHintFild,
            controller: ct.emailController,
            prefixIcon: const Icon(Icons.person),
          ),
        ],
      ),
      bottomBar: [
        CookieButton(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          label: AppLocalizations.of(context)!.forgetPasswordButton,
          onPressed: () async {
            //TODO FAZER O TRATAMENTO DE ERROR
            await ct.forgetPassword();
            ct.emailController.clear();

            final snackBar = SnackBar(
              content: CookieText(
                  text: 'Enviado para o seu email',
                  color: Theme.of(context).colorScheme.onSecondary),
              action: SnackBarAction(
                label: 'Voltar',
                onPressed: () {},
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
