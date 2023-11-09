import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/organisms/create_details_recipe.dart';
import 'package:flutter/material.dart';

class CreateRecipePage extends StatelessWidget {
  static const route = '/create-recipe';
  const CreateRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.arrow_back_rounded),
                SizedBox(width: 10),
                CookieText(text: 'Voltar'),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {},
              child: Container(
                color: Colors.amber,
                height: 100,
                child: const Icon(Icons.image_sharp),
              ),
            ),
            const SizedBox(height: 20),
            const CookieTextField.outline(
              hintText: 'Titulo da receita',
            ),
            const SizedBox(height: 10),
            const CookieTextField.outline(
              hintText: 'Subtitulo da receita',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomContainer(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Icon(Icons.lock_clock),
                          CookieText(text: '5 min')
                        ],
                      ),
                      SizedBox(width: 16),
                      Column(
                        children: [
                          Icon(Icons.lock_clock),
                          CookieText(text: 'Dificil')
                        ],
                      ),
                      SizedBox(width: 16),
                      Column(
                        children: [
                          Icon(Icons.lock_clock),
                          CookieText(text: '5 porções')
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.pedal_bike),
                    ),
                    const CookieText(text: 'Editar seção')
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const CreateDetailsRecipe(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
