import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/perfil/presenter/ui/pages/my_perfil_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/create_recipe_page.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateRecipePage.route);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: SvgPicture.asset('assets/icons/edit.svg'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: ListView(
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyPerfilPage.route);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CookieTextFieldSearch(
                hintText: 'Procure algo para cozinhar',
                onTap: () {
                  Navigator.pushNamed(context, SearchPage.route);
                },
              ),
              const SizedBox(height: 20),
              const CookieText(
                text: 'Últimas receitas postadas',
                typography: CookieTypography.title,
              ),
              const SizedBox(height: 10),
              MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
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
      ),
    );
  }
}

                  //       const CookieText(
                  //         text: 'Se liga nessas receitas em alta',
                  //         typography: CookieTypography.title,
                  //       ),
                  //       const SizedBox(height: 20),
                  //       const CookieText(
                  //         text: 'Receitas rápidas para seu dia-dia corrido',
                  //         typography: CookieTypography.title,
                  //       ),
                  //       const SizedBox(height: 10),
                  //       SizedBox(
                  //         width: 200,
                  //         child: Stack(
                  //           alignment: Alignment.topCenter,
                  //           children: [
                  //             Container(
                  //               margin: const EdgeInsets.only(top: 70),
                  //               padding: const EdgeInsets.all(16),
                  //               height: 180,
                  //               width: 200,
                  //               decoration: BoxDecoration(
                  //                 color: Colors.white,
                  //                 borderRadius: BorderRadius.circular(10),
                  //               ),
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.end,
                  //                 children: [
                  //                   CookieText(
                  //                     text: 'Salada de legumes',
                  //                     color:
                  //                         Theme.of(context).colorScheme.onSecondary,
                  //                   ),
                  //                   const Row(
                  //                     children: [],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Image.network(
                  //               'https://www.omachoalpha.com.br/wp-content/uploads/2017/07/food-17.jpg',
                  //               height: 140,
                  //               width: 140,
                  //             ),
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // SliverToBoxAdapter(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const CookieText(
                  //         text: 'Ingredientes mais procurados',
                  //         typography: CookieTypography.title,
                  //       ),
                  //       const SizedBox(height: 20),
                  //       Container(
                  //         height: 100,
                  //         width: 100,
                  //         padding: const EdgeInsets.all(16),
                  //         margin: const EdgeInsets.only(
                  //           right: 10,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           color: Colors.black,
                  //           borderRadius: BorderRadius.circular(50),
                  //         ),
                  //         child: Image.network(
                  //           'https://th.bing.com/th/id/R.e0fc37fb962b12449228c61b1966c305?rik=XRVOAwQCZME0%2fw&pid=ImgRaw&r=0',
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // )