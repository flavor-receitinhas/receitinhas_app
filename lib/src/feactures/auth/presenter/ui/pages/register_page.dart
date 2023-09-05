import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_span.dart';
import 'package:app_receitas/src/feactures/auth/presenter/controllers/auth_controller.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class RegisterPage extends StatefulWidget {
  static const route = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthController ct = GetIt.I();

  @override
  void dispose() {
    ct.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
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
            text: AppLocalizations.of(context)!.registerTitle,
            typography: CookieTypography.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          CookieTextField(
            hintText: AppLocalizations.of(context)!.registerEmail,
            controller: ct.emailController,
            prefixIcon: const Icon(Icons.person),
          ),
          const SizedBox(height: 10),
          CookieTextField(
            hintText: AppLocalizations.of(context)!.registerPassword,
            controller: ct.passwordController,
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            obscureText: true,
          ),
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: CookieTextSpan(
              children: [
                CookieTextSpan(
                  text: AppLocalizations.of(context)!.registerTerms1,
                  color: color.onPrimary,
                ),
                CookieTextSpan(
                  text: AppLocalizations.of(context)!.registerTerms2,
                  color: color.primary,
                ),
                CookieTextSpan(
                  text: AppLocalizations.of(context)!.registerTerms3,
                  color: color.onPrimary,
                ),
                CookieTextSpan(
                  text: AppLocalizations.of(context)!.registerTerms4,
                  color: color.primary,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomBar: [
        CookieButton(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          label: AppLocalizations.of(context)!.registerButton,
          onPressed: () async {
            var result = await ct.registerFirebase();
            if (result && mounted) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/protein-preference',
                (route) => false,
              );
            }
          },
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
