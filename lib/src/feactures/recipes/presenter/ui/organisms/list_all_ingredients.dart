import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/container_ingredient.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/sheet_select_ingredient.dart';
import 'package:flutter/material.dart';

class ListAllIngredients extends StatelessWidget {
  const ListAllIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            CookieSheetBottom(
              alignmentTitle: Alignment.center,
              title: CookieText(
                text: 'Selecionar quantidade',
                typography: CookieTypography.title,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              body: const SheetSelectIngredient(),
            ).show(context);
          },
          child: ContainerIngredient(
            body: const CookieText(
              text: 'Salada de Legume  asdasda  asd asdas dasd asdas d asdas',
              typography: CookieTypography.button,
            ),
            icon: const Icon(Icons.add),
            onTap: () {},
          ),
        );
      },
    );
  }
}
