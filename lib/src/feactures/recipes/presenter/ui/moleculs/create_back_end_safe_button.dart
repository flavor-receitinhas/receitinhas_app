import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class CreateBackAndSafeButton extends StatelessWidget {
  const CreateBackAndSafeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
          child: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
        const SizedBox(width: 10),
        const CookieText(text: 'Voltar'),
        const Spacer(),
        const CookieText(text: 'Salvar'),
        IconButton(
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
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  CookieButton.outline(
                    label: 'Continuar escrevendo',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ).show(context);
          },
          icon: const Icon(Icons.save),
        ),
      ],
    );
  }
}
