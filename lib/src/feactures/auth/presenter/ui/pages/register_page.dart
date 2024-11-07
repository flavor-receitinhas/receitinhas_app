import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_span.dart';
import 'package:app_receitas/src/feactures/auth/presenter/controllers/auth_controller.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/privacy_policy_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/term_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_manager/export_manager.dart';

class RegisterPage extends StatefulWidget {
  static const route = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ManagerPage<AuthController, RegisterPage> {
  final formKey = GlobalKey<FormState>();
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
    ColorScheme color = Theme.of(context).colorScheme;
    return CustomScreen(
      iconAppBar: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
      sideAppBar: MainAxisAlignment.start,
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(
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
              validator: (value) {
                if (value != null && !EmailValidator.validate(value)) {
                  return AppLocalizations.of(context)!.registerValidatorEmail;
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            CookieTextField(
              hintText: AppLocalizations.of(context)!.registerPassword,
              controller: ct.passwordController,
              prefixIcon: const Icon(Icons.lock_outline_rounded),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!
                      .registerValidatorPassword1;
                }
                if (value.length < 8) {
                  return AppLocalizations.of(context)!
                      .registerValidatorPassword2;
                }
                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                  return AppLocalizations.of(context)!
                      .registerValidatorPassword3;
                }
                if (!RegExp(r'[a-z]').hasMatch(value)) {
                  return AppLocalizations.of(context)!
                      .registerValidatorPassword4;
                }
                if (!RegExp(r'[0-9]').hasMatch(value)) {
                  return AppLocalizations.of(context)!
                      .registerValidatorPassword5;
                }
                return null;
              },
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
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, TermPage.route);
                      },
                  ),
                  CookieTextSpan(
                    text: AppLocalizations.of(context)!.registerTerms3,
                    color: color.onPrimary,
                  ),
                  CookieTextSpan(
                    text: AppLocalizations.of(context)!.registerTerms4,
                    color: color.primary,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, PrivacyPolicyPage.route);
                      },
                  ),
                ],
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
                  side: BorderSide(color: color.primary, width: 2),
                ),
              ),
              padding: const EdgeInsets.all(12),
              color: color.primary,
            ),
          ],
        ),
      ),
      bottomBar: [
        CookieButton(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          label: AppLocalizations.of(context)!.registerButton,
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              await ct.registerFirebase();
            }
          },
          isLoading: ct.state == StateManager.loading,
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
