import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:flutter/material.dart';

class CreateBackAndSafeButton extends StatelessWidget {
  final CreateRecipeController ct;
  const CreateBackAndSafeButton({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CookieButton(
          prefix: const Icon(Icons.chevron_left, size: 28),
          label: "Voltar",
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            CookieSheetBottom(
              title: CookieText(
                text: 'Deseja descartar sua receita ?',
                color: Theme.of(context).colorScheme.onSecondary,
                typography: CookieTypography.title,
              ),
              body: Column(children: [
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
              ]),
            ).show(context);
          },
        ),
        const Spacer(),
        TextButton.icon(
          label: const Icon(Icons.save),
          onPressed: () {
            CookieSheetBottom(
              title: CookieText(
                text: 'Deseja públicar sua receita ?',
                color: Theme.of(context).colorScheme.onSecondary,
                typography: CookieTypography.title,
              ),
              body: Column(
                children: [
                  CookieText(
                    text:
                        'Verifique bem se tem certeza, assim podemos mostrar ao mundo sua linda receita!',
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  const SizedBox(height: 10),
                  CookieButton(
                    label: 'Pulicar receita',
                    onPressed: () {
                      ct.createRecipe();
                    },
                  ),
                  const SizedBox(height: 10),
                  CookieButton.outline(
                    label: 'Salvar receita como rascunho',
                    onPressed: () {
                      ct.createRecipe();
                    },
                  ),
                  const SizedBox(height: 10),
                  CookieButton.outline(
                    label: 'Continuar escrevendo',
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ).show(context);
          },
          icon: const CookieText(text: 'Salvar'),
        ),
      ],
    );
  }
}
