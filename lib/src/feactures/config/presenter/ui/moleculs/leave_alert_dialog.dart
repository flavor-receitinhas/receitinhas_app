import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/welcome_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/controllers/config_controller.dart';
import 'package:flutter/material.dart';

class LeaveAlertDialog extends StatelessWidget {
  final ConfigController ct;
  const LeaveAlertDialog({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(20),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      title: CookieText(
        text: 'Deseja realmente sair da sua conta?',
        color: Theme.of(context).colorScheme.onSecondary,
        typography: CookieTypography.button,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CookieText(
            text:
                'Lembrando que ao sair da sua conta, podera acessar ela novamente usando suas credenciais.',
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          const SizedBox(height: 20),
          CookieButton.outline(
            label: 'Não desejo sair da conta',
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
