import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangedPasswordPage extends StatelessWidget {
  static const route = '/changed-password';
  const ChangedPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: const CookieSvg(svg: IconsSvgEnum.save),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CookieButton(
              label: AppLocalizations.of(context)!.configChangePassword,
            ).back(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  CookieText(
                    text: AppLocalizations.of(context)!.configOldPassword,
                    typography: CookieTypography.button,
                  ),
                  const SizedBox(height: 10),
                  CookieTextField.outline(
                    hintText:
                        AppLocalizations.of(context)!.configOldPasswordHint,
                    obscureText: true,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  CookieText(
                    text: AppLocalizations.of(context)!.configNewPassword,
                    typography: CookieTypography.button,
                  ),
                  const SizedBox(height: 10),
                  CookieTextField.outline(
                    hintText:
                        AppLocalizations.of(context)!.configNewPasswordHint,
                    maxLines: 1,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  CookieText(
                    text:
                        AppLocalizations.of(context)!.configConfirmNewPassword,
                    typography: CookieTypography.button,
                  ),
                  const SizedBox(height: 10),
                  CookieTextField.outline(
                    hintText: AppLocalizations.of(context)!
                        .configConfirmNewPasswordHint,
                    maxLines: 1,
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: CookieText(
                      text: AppLocalizations.of(context)!
                          .configPasswordChangeNotification,
                      textAlign: TextAlign.center,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
