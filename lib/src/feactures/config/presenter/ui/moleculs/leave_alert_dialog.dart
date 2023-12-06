import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/welcome_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/controllers/config_controller.dart';
import 'package:flutter/material.dart';

class LeaveAlertDialog extends StatelessWidget {
  final ConfigController ct;
  const LeaveAlertDialog({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      title: CookieText(
        text: 'Deseja sair da conta?',
        color: Theme.of(context).colorScheme.onSecondary,
        typography: CookieTypography.button,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CookieButton.outline(
            label: 'Continuar',
            labelColor: Theme.of(context).colorScheme.onSecondary,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 10),
          CookieButton(
            label: 'Sair da conta',
            labelColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Colors.red,
            onPressed: () {
              ct.logout().then(
                    (value) => Navigator.pushNamedAndRemoveUntil(
                        context, WelcomePage.route, (route) => false),
                  );
            },
          )
        ],
      ),
    );
  }
}
