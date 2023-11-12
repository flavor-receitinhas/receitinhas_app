import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/container_create_info.dart';
import 'package:flutter/material.dart';

class CreateDetailsRecipe extends StatelessWidget {
  final RecipeController ct;
  const CreateDetailsRecipe({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CookieText(
          text: 'Detalhes da receita',
          typography: CookieTypography.title,
        ),
        const SizedBox(height: 20),
        CookieTextField.outline(
          hintText: 'Adicione aqui os detalhes da sua receita...',
          controller: ct.detailsController,
        ),
        const SizedBox(height: 10),
        ContainerCreateInfo(
          title: 'Ingredientes',
          iconSvg: 'assets/icons/carrot.svg',
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle_outline_rounded,
                size: 34,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const ContainerCreateInfo(
          title: 'Instruções de preparo',
          iconSvg: 'assets/icons/knife.svg',
          child: CookieTextField(),
        ),
        const SizedBox(height: 20),
        const ContainerCreateInfo(
          title: 'Hora de se servir!',
          iconSvg: 'assets/icons/pan.svg',
          child: CookieTextField(),
        ),
      ],
    );
  }
}
