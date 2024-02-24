import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/select_ingredient_container.dart';
import 'package:flutter/material.dart';

class SelectIngredients extends StatelessWidget {
  const SelectIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: const CookieButton(label: 'Voltar').back(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 16, left: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CookieText(
                      text: 'Selecionar ingredientes',
                      typography: CookieTypography.title,
                    ),
                    SizedBox(height: 10),
                    CookieTextFieldSearch(
                        hintText: 'Pesquise seus ingredientes'),
                    SizedBox(height: 20),
                    CookieText(
                        text: 'Ingredientes selecionados (1)',
                        typography: CookieTypography.button),
                  ],
                ),
              ),
              SliverVisibility(
                visible: true,
                sliver: SliverList.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const SelectIngredientContainer();
                  },
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CookieText(
                    text: 'Escolha outros ingredientes abaixo',
                    typography: CookieTypography.button,
                  ),
                ),
              ),
              SliverList.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        height: 90,
                        padding: const EdgeInsets.only(
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        margin: const EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 110),
                            Expanded(
                              child: CookieText(
                                text: 'Salada de Legume  asdasda  asd',
                                typography: CookieTypography.button,
                                maxLine: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Image.network(
                          'https://media.discordapp.net/attachments/1071892919633576117/1174455155555586088/image.png?ex=6567a799&is=65553299&hm=e89afd78cf99f59bc2346946ae7355ba03fde27ad8a59c7cd50c6354835ed334&=&width=121&height=113',
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
