import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:flutter/material.dart';

class CreateAlertDialog extends StatelessWidget {
  const CreateAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      title: CookieText(
        text: 'Deseja descartar sua receita ?',
        color: Theme.of(context).colorScheme.onSecondary,
        typography: CookieTypography.button,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CookieText(
            text:
                'Ao descartar, não podemos recuperar o que foi escrito na sua receita.',
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          const SizedBox(height: 10),
          CookieButton.outline(
            label: 'Continuar escrevendo',
            labelColor: Theme.of(context).colorScheme.onSecondary,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 10),
          CookieButton(
            label: 'Descartar receita',
            labelColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Colors.red,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
