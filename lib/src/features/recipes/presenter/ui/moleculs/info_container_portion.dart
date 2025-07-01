import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class InfoContainerPortion extends StatelessWidget {
  final CreateRecipeController ct;
  final Function(String) onChangedField;
  final Function() onPressedDecresead;
  final Function() onPressedIncrease;
  const InfoContainerPortion({
    super.key,
    required this.ct,
    required this.onChangedField,
    required this.onPressedDecresead,
    required this.onPressedIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            CookieText(
              text: AppLocalizations.of(context)!.recipePortionTitle,
              typography: CookieTypography.button,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            const SizedBox(height: 20),
            CookieText(
              text: AppLocalizations.of(context)!.recipePortionQuestion,
              typography: CookieTypography.title,
              color: Theme.of(context).colorScheme.onSecondary,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CookieSvg(
                  svg: IconsSvgEnum.pot,
                  height: 70,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                IconButton(
                  onPressed: onPressedDecresead,
                  color: Theme.of(context).colorScheme.onSecondary,
                  icon: const Icon(Icons.remove_circle_rounded, size: 30),
                ),
                SizedBox(
                  width: 60,
                  child: TextField(
                    controller: ct.portionController,
                    onChanged: onChangedField,
                    maxLength: 3,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    decoration: const InputDecoration(
                      counterText: '',
                      hintStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onPressedIncrease,
                  color: Theme.of(context).colorScheme.onSecondary,
                  icon: const Icon(Icons.add_circle_rounded, size: 30),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CookieButton(
                    label: AppLocalizations.of(context)!.recipeDifficultyBack,
                    onPressed: () {
                      ct.containerController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CookieButton(
                    label:
                        AppLocalizations.of(
                          context,
                        )!.recipeCreateBackEndSafeButtonSave,
                    onPressed: () {
                      if (ct.portion > 0) {
                        ct.pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      } else {
                        final snackBar = SnackBar(
                          content: CookieText(
                            text:
                                AppLocalizations.of(
                                  context,
                                )!.recipePortionSnackBarMessage,
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
