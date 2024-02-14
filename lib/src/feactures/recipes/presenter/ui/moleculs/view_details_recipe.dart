import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ViewDetailsRecipe extends StatelessWidget {
  final RecipeEntity recipe;
  const ViewDetailsRecipe({super.key, required this.recipe});

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
        CookieText(
          text: recipe.details!,
        ),
        const SizedBox(height: 20),
        CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CookieText(
                    text: 'Ingredientes',
                    typography: CookieTypography.title,
                  ),
                  SvgPicture.asset('assets/icons/carrot.svg'),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: recipe.ingredients.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CookieText(text: recipe.ingredients[index]);
                },
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CookieText(
                    text: 'Instruções de preparo',
                    typography: CookieTypography.title,
                  ),
                  SvgPicture.asset('assets/icons/knife.svg'),
                ],
              ),
              const SizedBox(height: 20),
              CookieText(
                text: recipe.instruction,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: recipe.serveFood!.isNotEmpty,
          child: CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CookieText(
                      text: 'Hora de se servir!',
                      typography: CookieTypography.title,
                    ),
                    SvgPicture.asset('assets/icons/pan.svg'),
                  ],
                ),
                const SizedBox(height: 20),
                CookieText(
                  text: recipe.serveFood!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
