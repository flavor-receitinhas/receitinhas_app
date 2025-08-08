import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text_field.dart';
import 'package:app_receitas/src/features/auth/presenter/controllers/auth_controller.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/pages/forget_password_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:page_manager/entities/state_manager.dart';
import 'package:page_manager/manager_page.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ManagerPage<AuthController, LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    ct.onNavigation(
      (event) =>
          Navigator.pushNamedAndRemoveUntil(context, event, (route) => false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                ImagesEnum.eggHello.path,
                height: MediaQuery.sizeOf(context).height * 0.33,
              ),
              const SizedBox(height: 24),
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
                validator: (value) {
                  if (value != null && !EmailValidator.validate(value)) {
                    return AppLocalizations.of(context)!.registerValidatorEmail;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CookieTextField(
                hintText: AppLocalizations.of(context)!.loginPassword,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                controller: ct.passwordController,
                obscureText: ct.showPassword,
                maxLines: 1,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return AppLocalizations.of(
                      context,
                    )!.registerValidatorPassword1;
                  }
                  if (value!.length < 8) {
                    return AppLocalizations.of(
                      context,
                    )!.registerValidatorPassword2;
                  }
                  return null;
                },
                suffixIcon: GestureDetector(
                  child:
                      ct.showPassword
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
                icon: Image.asset(ImagesEnum.google.path, height: 25),
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
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomBar: [
        CookieButton(
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          label: AppLocalizations.of(context)!.loginButton,
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            }
            await ct.loginFirebase();
          },
          isLoading: ct.state == StateManager.loading,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
