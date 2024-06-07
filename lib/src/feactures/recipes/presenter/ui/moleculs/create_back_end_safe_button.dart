import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:flutter/material.dart';

class CreateBackAndSafeButton extends StatelessWidget {
  final CreateRecipeController ct;
  const CreateBackAndSafeButton({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
