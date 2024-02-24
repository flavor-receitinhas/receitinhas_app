import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/view_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/view_details_recipe.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/view_introduce_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class ViewRecipesPage extends StatefulWidget {
  static const route = '/view-recipe';
  const ViewRecipesPage({super.key});

  @override
  State<ViewRecipesPage> createState() => _ViewRecipesPageState();
}

class _ViewRecipesPageState extends State<ViewRecipesPage> {
  final ViewRecipeController ct = di();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => ct.init(context));
    ct.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: ct.state,
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: const CookieButton(label: 'Voltar').back(context),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: CookieButton(
      //     label: 'Preparar esta receita',
      //     onPressed: () {},
      //   ),
      // ),
      done: (_) => SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            FlutterCarousel(
                options: CarouselOptions(
                  height: 250,
                  showIndicator: true,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  padEnds: false,
                ),
                items: ct.recipe.images
                    .map((e) => Image.network(e, fit: BoxFit.cover))
                    .toList()),
            const SizedBox(height: 10),
            ViewIntroduceRecipe(recipe: ct.recipe),
            const SizedBox(height: 20),
            ViewDetailsRecipe(recipe: ct.recipe),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
