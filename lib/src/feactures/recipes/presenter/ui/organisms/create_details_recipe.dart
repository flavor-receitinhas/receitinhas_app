import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/container_create_info.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/select_ingredients.dart';
import 'package:flutter/material.dart';

class CreateDetailsRecipe extends StatelessWidget {
  final CreateRecipeController ct;
  const CreateDetailsRecipe({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        ContainerCreateInfo(
          title: 'Ingredientes',
          iconSvg: 'assets/icons/carrot.svg',
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectIngredients(),
                  ),
                );
              },
              icon: const Icon(
                Icons.add_circle_outline_rounded,
                size: 34,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ContainerCreateInfo(
          title: 'Instruções de preparo',
          iconSvg: 'assets/icons/knife.svg',
          child: CookieTextField(
            controller: ct.instructionController,
            maxLines: 4,
            validator: (value) {
              if (value != null && value.length < 30) {
                return "Escreva mais algumas instruções";
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 20),
        ContainerCreateInfo(
          title: 'Hora de se servir!',
          iconSvg: 'assets/icons/pan.svg',
          child:
              CookieTextField(controller: ct.serveFoodController, maxLines: 4),
        ),
      ],
    );
  }
}
