import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/back_buttom_floating.dart';
import 'package:app_receitas/src/feactures/search/presenter/controller/research_controller.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/moleculs/search_recipe.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/organisms/result_recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchPage extends StatefulWidget {
  static const route = '/search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ResearchController ct = di();

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
      done: () => CustomScrollView(
        slivers: [
          BackButtomFloating(
            label: AppLocalizations.of(context)!.searchLabel,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            sliver: SliverToBoxAdapter(
              child: SearchRecipe(
                ct: ct,
              ),
            ),
          ),
          SliverToBoxAdapter(child: ResultRecipes(ct: ct)),
        ],
      ),
    );
  }
}
