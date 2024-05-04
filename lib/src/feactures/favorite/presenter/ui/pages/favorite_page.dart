import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/controllers/favorite_controller.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/ui/moleculs/container_recipe.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/ui/moleculs/organize_recipes.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/atomic/container_profile_image.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/view_recipe_page.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  static const route = '/favorite';
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteController ct = di();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => ct.init());
    ct.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: ct.state,
      done: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CookieText(
                        text: 'Lista de Favoritos',
                        typography: CookieTypography.title,
                      ),
                      CookieText(text: 'Gerencie suas receitas favoritas'),
                    ],
                  ),
                  ContainerProfileImage()
                ],
              ),
              const SizedBox(height: 20),
              const CookieTextFieldSearch(
                hintText: 'Pesquise sua receita favorita',
              ),
              const SizedBox(height: 10),
              OrganizeRecipes(
                onTapRecent: () {
                  setState(() {
                    ct.listFavoriteRecipes('createdAt');
                  });
                  Navigator.pop(context);
                },
                onTapOld: () {
                  setState(() {
                    ct.listFavoriteRecipes('createdAt');
                  });
                  Navigator.pop(context);
                },
                onTapAsc: () {
                  setState(() {
                    ct.listFavoriteRecipes('name');
                  });
                  Navigator.pop(context);
                },
                onTapDesc: () async {
                  setState(() {
                    ct.listFavoriteRecipes('name');
                  });
                  Navigator.pop(context);
                },
              ),
              ListView.builder(
                itemCount: ct.listFavorite.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, idx) {
                  final favorite = ct.listFavorite[idx];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ViewRecipesPage.route);
                      },
                      child: ContainerRecipe(
                        nameRecipe: favorite.name,
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
