import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class ViewIntroduceRecipe extends StatelessWidget {
  final String title;
  final String? subTitle;
  final int timePrepared;
  final int portion;
  final String difficultyRecipe;
  final bool isCreate;
  final void Function()? onPressedFavorite;
  final bool isFavorite;
  final String userName;
  final void Function()? onPressedUser;
  final bool ownsTheRecipe;

  const ViewIntroduceRecipe({
    super.key,
    required this.title,
    required this.subTitle,
    required this.timePrepared,
    required this.portion,
    required this.difficultyRecipe,
    required this.isCreate,
    this.onPressedFavorite,
    this.isFavorite = false,
    required this.userName,
    this.onPressedUser,
    this.ownsTheRecipe = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CookieText(text: title, typography: CookieTypography.title),
          ],
        ),
        InkWell(
          onTap: onPressedUser,
          child: RichText(
            text: CookieTextSpan(
              children: [
                CookieTextSpan(
                  text: '${AppLocalizations.of(context)!.recipeIntroduceBy} ',
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                CookieTextSpan(
                  text: userName,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        subTitle!.isNotEmpty && subTitle != null
            ? CookieText(text: subTitle!)
            : const SizedBox.shrink(),
        subTitle!.isNotEmpty && subTitle != null
            ? const SizedBox(height: 20)
            : const SizedBox.shrink(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomContainer(
              child: Row(
                children: [
                  Column(
                    children: [
                      const CookieSvg(svg: IconsSvgEnum.clock, height: 20),
                      const SizedBox(height: 5),
                      CookieText(
                        text:
                            '$timePrepared ${AppLocalizations.of(context)!.recipeIntroduceTimePrepared}',
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      const CookieSvg(svg: IconsSvgEnum.fire, height: 20),
                      const SizedBox(height: 5),
                      CookieText(text: difficultyRecipe),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      const CookieSvg(svg: IconsSvgEnum.pot, height: 20),
                      const SizedBox(height: 5),
                      CookieText(
                        text:
                            portion != 1
                                ? '$portion ${AppLocalizations.of(context)!.recipeIntroducePortionPlural}'
                                : '$portion ${AppLocalizations.of(context)!.recipeIntroducePortionSingular}',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !isCreate,
              child: InkWell(
                onTap: onPressedFavorite,
                child: Container(
                  width: 80,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: CookieSvg(
                    svg: IconsSvgEnum.heart,
                    color:
                        isFavorite
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
