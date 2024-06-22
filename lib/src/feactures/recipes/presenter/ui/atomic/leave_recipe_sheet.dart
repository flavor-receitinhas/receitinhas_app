import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class LeaveRecipeSheet extends StatelessWidget {
  const LeaveRecipeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CookieText(
        text:
            'Ao descartar, não podemos recuperar o que foi escrito na sua receita.',
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      const SizedBox(height: 10),
      CookieButton.outline(
        label: 'Continuar escrevendo',
        labelColor: Theme.of(context).colorScheme.onSecondary,
        onPressed: () => Navigator.pop(context),
      ),
      const SizedBox(height: 10),
      CookieButton(
        label: 'Descartar receita',
        labelColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            CustomBottomBar.route,
            (route) => false,
          );
        },
      )
    ]);
  }
}
