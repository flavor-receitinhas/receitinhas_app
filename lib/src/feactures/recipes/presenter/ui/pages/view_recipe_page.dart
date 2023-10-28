import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/view_details_recipe.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/view_introduce_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class ViewRecipesPage extends StatelessWidget {
  static const route = '/view-recipe';
  const ViewRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: CookieButton(
          label: 'Preparar esta receita',
          onPressed: () {},
        ),
      ),
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
            FlutterCarousel(
              options: CarouselOptions(
                height: 250,
                showIndicator: true,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                padEnds: false,
              ),
              items: [
                Image.network(
                  'https://th.bing.com/th/id/OIP.ZZsn6lD6PCjocBzx1tuu1QHaEo?pid=ImgDet&rs=1',
                ),
                Image.network(
                  'https://th.bing.com/th/id/OIP.ZZsn6lD6PCjocBzx1tuu1QHaEo?pid=ImgDet&rs=1',
                ),
                Image.network(
                  'https://th.bing.com/th/id/OIP.ZZsn6lD6PCjocBzx1tuu1QHaEo?pid=ImgDet&rs=1',
                ),
                Image.network(
                  'https://th.bing.com/th/id/OIP.ZZsn6lD6PCjocBzx1tuu1QHaEo?pid=ImgDet&rs=1',
                ),
              ],
            ),
            const SizedBox(height: 10),
            const ViewIntroduceRecipe(),
            const SizedBox(height: 20),
            const ViewDetailsRecipe(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
