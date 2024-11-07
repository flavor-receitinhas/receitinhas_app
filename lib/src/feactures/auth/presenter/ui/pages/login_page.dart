import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/auth/presenter/controllers/auth_controller.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/forget_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_manager/entities/state_manager.dart';
import 'package:page_manager/manager_page.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ManagerPage<AuthController, LoginPage> {
  @override
  void initState() {
    ct.onNavigation(
      (event) => Navigator.pushNamedAndRemoveUntil(
        context,
        event,
        (route) => false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      iconAppBar: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
      sideAppBar: MainAxisAlignment.start,
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
            obscureText: ct.showPassword,
            maxLines: 1,
            suffixIcon: GestureDetector(
              child: ct.showPassword
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              onTap: () {
                setState(() {
                  ct.showPassword = !ct.showPassword;
                });
              },
            ),
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
          const SizedBox(height: 10),
          IconButton(
            onPressed: () async {
              await ct.loginGoogle();
            },
            icon: Image.asset(
              ImagesEnum.google.path,
              height: 25,
            ),
            style: IconButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
            ),
            padding: const EdgeInsets.all(12),
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomBar: [
        CookieButton(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          label: AppLocalizations.of(context)!.loginButton,
          onPressed: () async {
            await ct.loginFirebase();
          },
          isLoading: ct.state == StateManager.loading,
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
