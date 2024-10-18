import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/search/domain/enum/order_by_filter.dart';
import 'package:app_receitas/src/feactures/search/presenter/controller/research_controller.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/atomic/container_filter.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/moleculs/custom_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterPage extends StatefulWidget {
  final ResearchController ct;
  const FilterPage({super.key, required this.ct});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<OrderByFilter> selectOrderBy = [OrderByFilter.asc];
  List<DifficultyRecipe> selectDifficulty = DifficultyRecipe.values.toList();
  var selectRangePreparationTime = const RangeValues(1, 999);
  var selectRangePortion = const RangeValues(1, 99);
  bool? desc;

  void updateOrder(OrderByFilter order) {
    bool isAsc = order == OrderByFilter.asc;
    desc = !isAsc;

    if (!selectOrderBy.contains(order)) {
      selectOrderBy.add(order);
    }

    OrderByFilter oppositeOrder =
        isAsc ? OrderByFilter.desc : OrderByFilter.asc;
    if (selectOrderBy.contains(oppositeOrder)) {
      selectOrderBy.remove(oppositeOrder);
    }
  }

  void updateDifficulty(DifficultyRecipe difficulty) {
    if (!selectDifficulty.contains(difficulty)) {
      selectDifficulty.add(difficulty);
    } else {
      selectDifficulty.remove(difficulty);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      bottomNavigationBar: CookieButton(
        label: AppLocalizations.of(context)!.searchRecipeApplyFilter,
        margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
        onPressed: () {
          widget.ct.timePreparedFrom = selectRangePreparationTime.start.toInt();
          widget.ct.timePreparedTo = selectRangePreparationTime.end.toInt();
          widget.ct.portionFrom = selectRangePortion.start.toInt();
          widget.ct.portionTo = selectRangePortion.end.toInt();
          widget.ct.difficultyRecipe = selectDifficulty;
          widget.ct.isDesc = desc;
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
            children: [
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipeFilterBy,
                typography: CookieTypography.title,
                color: theme.primary,
              ),
              const SizedBox(height: 20),
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipeOrderBy,
              ),
              const SizedBox(height: 10),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 50,
                ),
                physics: const NeverScrollableScrollPhysics(),
                //scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: OrderByFilter.values.length,
                itemBuilder: (context, index) {
                  final order = OrderByFilter.values[index];
                  return ContainerFilter(
                    text: order.titleDescription(context),
                    isSelect: selectOrderBy.contains(order),
                    onTap: () {
                      setState(() {
                        updateOrder(order);
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipePreparationTime,
                typography: CookieTypography.button,
              ),
              CustomSlide(
                minRange: 1,
                maxRange: 999,
                selectRange: selectRangePreparationTime,
                onChanged: (RangeValues values) {
                  setState(() {
                    selectRangePreparationTime = values;
                  });
                },
              ),
              const SizedBox(height: 20),
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipeIngredients,
                typography: CookieTypography.button,
              ),
              const SizedBox(height: 20),
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipePortions,
                typography: CookieTypography.button,
              ),
              CustomSlide(
                minRange: 1,
                maxRange: 99,
                selectRange: selectRangePortion,
                onChanged: (RangeValues values) {
                  setState(() {
                    selectRangePortion = values;
                  });
                },
              ),
              // const SizedBox(height: 20),
              // CookieText(
              //   text: AppLocalizations.of(context)!.searchRecipeFoodPreference,
              //   typography: CookieTypography.button,
              // ),
              // const SizedBox(height: 10),
              // GridView.builder(
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 3,
              //     mainAxisSpacing: 10,
              //     mainAxisExtent: 50,
              //   ),
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: preference.length,
              //   itemBuilder: (context, index) {
              //     return ContainerFilter(
              //       text: preference[index],
              //       isSelect: false,
              //     );
              //   },
              // ),
              const SizedBox(height: 20),
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipeDifficulty,
                typography: CookieTypography.button,
              ),
              const SizedBox(height: 10),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 50,
                ),
                physics: const NeverScrollableScrollPhysics(),
                //scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: DifficultyRecipe.values.length,
                itemBuilder: (context, index) {
                  final order = DifficultyRecipe.values[index];
                  return ContainerFilter(
                    text: order.titleDescription(context),
                    isSelect: selectDifficulty.contains(order),
                    onTap: () {
                      setState(() {
                        updateDifficulty(order);
                      });
                    },
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
