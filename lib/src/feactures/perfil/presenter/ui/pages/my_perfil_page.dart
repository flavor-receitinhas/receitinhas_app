import 'package:app_receitas/src/core/widgets/cookie_left_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyPerfilPage extends StatelessWidget {
  static const route = '/my-perfil';
  const MyPerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CookieText(
                    text: 'Seu perfil',
                    typography: CookieTypography.title,
                    color: theme.primary,
                  ),
                  const CookieText(text: 'Aqui fica suas receitas publicadas'),
                ],
              ),
            ),
            const Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: CircleAvatar(
                      radius: 65,
                    ),
                  ),
                ),
                CookieLeftButton(
                  title: 'Home',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Center(
                    child: CookieText(
                      text: 'Nietzche',
                      typography: CookieTypography.title,
                    ),
                  ),
                  const Center(
                    child: CookieText(
                      text: 'mestre-cuca',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CookieText(
                    text:
                        'A parada é cozinhar meu parceiro, senão a pessoa passa é fome...',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const CookieTextFieldSearch(
                    hintText: 'Pesquise sua receita favorita',
                  ),
                  const SizedBox(height: 20),
                  MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
