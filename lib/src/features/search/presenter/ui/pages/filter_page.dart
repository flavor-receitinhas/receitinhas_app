import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/search/domain/enum/order_by_filter.dart';
import 'package:app_receitas/src/features/search/presenter/controller/research_controller.dart';
import 'package:app_receitas/src/features/search/presenter/ui/atomic/container_filter.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_slide.dart';
import 'package:domain_receitinhas/features/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:page_manager/entities/state_manager.dart';

class FilterPage extends StatefulWidget {
  final ResearchController ct;
  const FilterPage({super.key, required this.ct});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<OrderByFilter> selectOrderBy = [OrderByFilter.asc];
  List<DifficultyRecipe> difficulty = DifficultyRecipe.values.toList();
  String? selectDifficulty;
  var selectRangePreparationTime = const RangeValues(1, 6000);
  var selectRangePortion = const RangeValues(1, 999);
  bool desc = true;

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
    if (selectDifficulty == difficulty.name) {
      selectDifficulty = null;
    } else {
      selectDifficulty = difficulty.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return CookiePage(
      state: StateManager.done,
      error: widget.ct.errorMessage,
      errorReload: () async => await widget.ct.init(),
      bottomNavigationBar: CookieButton(
        label: AppLocalizations.of(context)!.searchRecipeApplyFilter,
        margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
        onPressed: () {
          if (selectRangePreparationTime.start.toInt() != 1) {
            widget.ct.timePreparedFrom =
                selectRangePreparationTime.start.toInt();
          }
          if (selectRangePreparationTime.end.toInt() != 6000) {
            widget.ct.timePreparedTo = selectRangePreparationTime.end.toInt();
          }
          if (selectRangePortion.start.toInt() != 1) {
            widget.ct.portionFrom = selectRangePortion.start.toInt();
          }
          if (selectRangePortion.end.toInt() != 999) {
            widget.ct.portionTo = selectRangePortion.end.toInt();
          }
          if (difficulty.isNotEmpty) {
            widget.ct.difficultyRecipe = selectDifficulty;
          }

          widget.ct.isDesc = desc;

          Navigator.pop(context);
        },
      ),
      done:
          () => SafeArea(
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 50,
                        ),
                    physics: const NeverScrollableScrollPhysics(),
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
                    text:
                        AppLocalizations.of(
                          context,
                        )!.searchRecipePreparationTime,
                    typography: CookieTypography.button,
                  ),
                  CookieSlide(
                    minRange: 1,
                    maxRange: 6000,
                    labels: RangeLabels(
                      widget.ct.formatTime(selectRangePreparationTime.start),
                      widget.ct.formatTime(selectRangePreparationTime.end),
                    ),
                    selectRange: selectRangePreparationTime,
                    onChanged: (RangeValues values) {
                      setState(() {
                        selectRangePreparationTime = values;
                      });
                    },
                    textLabelStart: widget.ct.formatTime(1),
                    textLabelEnd: widget.ct.formatTime(6000),
                  ),
                  // const SizedBox(height: 20),
                  // CookieText(
                  //   text: AppLocalizations.of(context)!.searchRecipeIngredients,
                  //   typography: CookieTypography.button,
                  // ),
                  const SizedBox(height: 20),
                  CookieText(
                    text: AppLocalizations.of(context)!.searchRecipePortions,
                    typography: CookieTypography.button,
                  ),
                  CookieSlide(
                    minRange: 1,
                    maxRange: 999,
                    labels: RangeLabels(
                      '${selectRangePortion.start.round()}',
                      '${selectRangePortion.end.round()}',
                    ),
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 50,
                        ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: DifficultyRecipe.values.length,
                    itemBuilder: (context, index) {
                      final order = DifficultyRecipe.values[index];
                      return ContainerFilter(
                        text: widget.ct.difficultyRecipeTitle(order, context),
                        isSelect:
                            selectDifficulty?.contains(order.name) ?? false,
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
