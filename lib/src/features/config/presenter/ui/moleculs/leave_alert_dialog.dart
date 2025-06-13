import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/auth/presenter/ui/pages/welcome_page.dart';
import 'package:app_receitas/src/features/config/presenter/controllers/config_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class LeaveAlertDialog extends StatelessWidget {
  final ConfigController ct;
  const LeaveAlertDialog({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  void show(BuildContext context) {
    CookieSheetBottom(
      title: CookieText(
        text: AppLocalizations.of(context)!.configLogoutPrompt,
        color: Theme.of(context).colorScheme.onSecondary,
        typography: CookieTypography.button,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CookieText(
            text: AppLocalizations.of(context)!.configLogoutReminder,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          const SizedBox(height: 20),
          CookieButton.outline(
            label: AppLocalizations.of(context)!.configDontLogout,
            labelColor: Theme.of(context).colorScheme.onSecondary,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 10),
          CookieButton(
            label: AppLocalizations.of(context)!.configLogout,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Colors.red,
            onPressed: () {
              ct.logout().then(
                    (value) => Navigator.pushNamedAndRemoveUntil(
                      context,
                      WelcomePage.route,
                      (route) => false,
                    ),
                  );
            },
          ),
        ],
      ),
    ).show(context);
  }
}
