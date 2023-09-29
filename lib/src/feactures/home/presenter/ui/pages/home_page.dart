import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field_search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CookieText(
                              text: 'Ola, nietz!',
                              typography: CookieTypography.title,
                            ),
                            CookieText(
                              text: 'O que vamos cozinhar hoje ?',
                            ),
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Expanded(
                          child: CookieTextFieldSearch(
                            hintText: 'Procure algo para cozinhar',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: const Icon(Icons.menu),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const CookieText(
                      text: 'Se liga nessas receitas em alta',
                      typography: CookieTypography.title,
                    ),
                    const SizedBox(height: 20),
                    const CookieText(
                      text: 'Receitas rápidas para seu dia-dia corrido',
                      typography: CookieTypography.title,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 70),
                            padding: const EdgeInsets.all(16),
                            height: 180,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CookieText(
                                  text: 'Salada de legumes',
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                const Row(
                                  children: [],
                                ),
                              ],
                            ),
                          ),
                          Image.network(
                            'https://www.omachoalpha.com.br/wp-content/uploads/2017/07/food-17.jpg',
                            height: 140,
                            width: 140,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
