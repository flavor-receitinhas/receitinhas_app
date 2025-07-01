import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text_field.dart';
import 'package:app_receitas/src/features/auth/presenter/controllers/auth_controller.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:page_manager/export_manager.dart';

class ForgetPasswordPage extends StatefulWidget {
  static const route = '/forget-password';
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState
    extends ManagerPage<AuthController, ForgetPasswordPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final snack = ScaffoldMessenger.of(context);
    return CustomScreen(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Spacer(),
            Image.asset(ImagesEnum.eggForget.path),
            Spacer(),
            CookieText(
              text: AppLocalizations.of(context)!.forgetPasswordTitle,
              typography: CookieTypography.title,
            ),
            const SizedBox(height: 10),
            CookieText(text: AppLocalizations.of(context)!.forgetPasswordBody),
            const SizedBox(height: 20),
            CookieTextField(
              hintText: AppLocalizations.of(context)!.forgetPasswordHintFild,
              controller: ct.emailController,
              prefixIcon: const Icon(Icons.person),
              validator: (value) {
                if (value != null && !EmailValidator.validate(value)) {
                  return AppLocalizations.of(
                    context,
                  )!.forgetPasswordValidatorEmail;
                }
                return null;
              },
            ),
          ],
        ),
      ),
      bottomBar: [
        CookieButton(
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          label: AppLocalizations.of(context)!.forgetPasswordButton,
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              await ct.forgetPassword();
              ct.emailController.clear();
              if (context.mounted) {
                final snackBar = SnackBar(
                  content: CookieText(
                    text: AppLocalizations.of(context)!.forgetPasswordTextSnack,
                    color: theme.onSecondary,
                  ),
                  action: SnackBarAction(
                    label:
                        AppLocalizations.of(context)!.forgetPasswordOptionSnack,
                    onPressed: () {},
                  ),
                );
                snack.showSnackBar(snackBar);
              }
            }
          },
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
