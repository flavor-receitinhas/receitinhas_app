import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/moleculs/info_container_difficulty_recipe.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/moleculs/info_container_portion.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/moleculs/info_container_time_prepared.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class InfoCreatePage extends StatefulWidget {
  final CreateRecipeController ct;
  const InfoCreatePage({super.key, required this.ct});

  @override
  State<InfoCreatePage> createState() => _InfoCreatePageState();
}

class _InfoCreatePageState extends State<InfoCreatePage> {
  CreateRecipeController get ct => widget.ct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 32,
            child: Column(
              children: [
                const SizedBox(height: 10),
                CookieButton(
                  label:
                      AppLocalizations.of(context)!.profileViewProfilePageBack,
                  onPressed: () {
                    ct.pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ).back(context),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CookieText(
                        text: AppLocalizations.of(context)!
                            .recipeCustomizeBasicInfoTitle,
                        typography: CookieTypography.title,
                      ),
                      const SizedBox(height: 10),
                      CookieText(
                        text: AppLocalizations.of(context)!
                            .recipeCustomizeBasicInfoDescription,
                      ),
                      const SizedBox(height: 20),
                      CustomContainer(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Visibility(
                              visible: ct.timePreparedRecipe.inMinutes > 0,
                              child: Column(
                                children: [
                                  const CookieSvg(
                                    svg: IconsSvgEnum.clock,
                                  ),
                                  const SizedBox(height: 5),
                                  CookieText(
                                    text: ct.durationRecipeString,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              children: [
                                const CookieSvg(
                                  svg: IconsSvgEnum.fire,
                                ),
                                const SizedBox(height: 5),
                                CookieText(text: ct.difficultyRecipeString)
                              ],
                            ),
                            const SizedBox(width: 16),
                            Visibility(
                              visible: ct.portion > 0,
                              child: Column(
                                children: [
                                  const CookieSvg(
                                    svg: IconsSvgEnum.pot,
                                  ),
                                  const SizedBox(height: 5),
                                  CookieText(
                                    text:
                                        '${ct.portion} ${AppLocalizations.of(context)!.recipePortions}',
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.48,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: ct.containerController,
                    children: [
                      InfoContainerTimePrepared(
                        ct: ct,
                        onChange: (val) {
                          if (val.inHours > 99) {
                            return;
                          }
                          setState(() {
                            widget.ct.timePreparedRecipe = val;
                            widget.ct.hourController.text =
                                val.inHours.toString();
                            widget.ct.minuteController.text =
                                (val.inMinutes % 60).toString();
                          });
                        },
                        onChangedHour: (value) {
                          setState(
                            () => widget.ct.timePreparedRecipe = Duration(
                              hours: value.isEmpty ? 0 : int.parse(value),
                              minutes:
                                  widget.ct.timePreparedRecipe.inMinutes % 60,
                            ),
                          );
                        },
                        onChangedMinute: (value) {
                          setState(() {
                            widget.ct.timePreparedRecipe = Duration(
                              hours: widget.ct.timePreparedRecipe.inHours,
                              minutes: value.isEmpty ? 0 : int.parse(value),
                            );
                          });
                        },
                      ),
                      InfoContainerDifficultyRecipe(
                        ct: ct,
                        onChanged: (e) {
                          setState(() {
                            widget.ct.difficultyRecipe = e;
                          });
                        },
                      ),
                      InfoContainerPortion(
                        ct: ct,
                        onChangedField: (value) {
                          ct.portion = int.tryParse(value) ?? 0;
                        },
                        onPressedIncrease: () {
                          if (ct.portion < 999) {
                            setState(() {
                              ct.portion++;
                              ct.portionController.text = ct.portion.toString();
                            });
                          }
                        },
                        onPressedDecresead: () {
                          if (ct.portion > 0) {
                            ct.portion--;

                            setState(() {
                              ct.portionController.text = ct.portion.toString();
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
