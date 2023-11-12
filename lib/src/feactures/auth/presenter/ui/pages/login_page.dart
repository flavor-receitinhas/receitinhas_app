import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/auth/presenter/controllers/auth_controller.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/forget_password_page.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    ct.dispose();
    super.dispose();
  }

  AuthController ct = di();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final snack = ScaffoldMessenger.of(context);
    return CustomScreen(
      iconAppBar: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
      sideAppBar: MainAxisAlignment.start,
      image:
          'https://media.discordapp.net/attachments/1071892919633576117/1139752601982873670/image.png?width=550&height=475',
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
            controller: ct.emailController,
            prefixIcon: const Icon(Icons.person),
          ),
          const SizedBox(height: 10),
          CookieTextField(
            hintText: AppLocalizations.of(context)!.loginPassword,
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            controller: ct.passwordController,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: CookieTextButton(
              text: AppLocalizations.of(context)!.loginForgetPassword,
              onPressed: () {
                Navigator.pushNamed(context, ForgetPasswordPage.route);
              },
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomBar: [
        CookieButton(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          label: AppLocalizations.of(context)!.loginButton,
          onPressed: () async {
            var result = await ct.loginFirebase();
            if (!result && mounted) {
              final snackBar = SnackBar(
                content: CookieText(
                  text: AppLocalizations.of(context)!.loginTextSnack,
                  color: theme.onSecondary,
                ),
                action: SnackBarAction(
                  label: AppLocalizations.of(context)!.loginOptionSnack,
                  onPressed: () {},
                ),
              );
              snack.showSnackBar(snackBar);
            }
            if (result && mounted) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                CustomBottomBar.route,
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
