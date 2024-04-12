import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:flutter/material.dart';

class BackSheet extends StatelessWidget {
  const BackSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CookieText(
          text:
              'Você tem certeza que deseja sair sem salvar as alterações?',
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        const SizedBox(height: 10),
        CookieButton(
            label: 'Sair sem salvar',
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            }),
        const SizedBox(height: 10),
        CookieButton.outline(
          label: 'Continuar editando',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
