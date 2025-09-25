import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_recipe_badge.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
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
        CookieText(text: title, typography: CookieTypography.title),
        const SizedBox(height: 16),
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
        const SizedBox(height: 16),
        subTitle!.isNotEmpty && subTitle != null
            ? CookieText(text: subTitle!)
            : const SizedBox.shrink(),
        subTitle!.isNotEmpty && subTitle != null
            ? const SizedBox(height: 20)
            : const SizedBox.shrink(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                CookieRecipeBadge(
                  icon: IconsSvgEnum.clock,
                  label: formatarTime(context, timePrepared),
                ),
                const SizedBox(width: 10),
                CookieRecipeBadge(
                  icon: IconsSvgEnum.fire,
                  label: difficultyRecipe,
                ),
                const SizedBox(width: 10),
                CookieRecipeBadge(icon: IconsSvgEnum.pot, label: '$portion'),
                const SizedBox(width: 10),
              ],
            ),
            Visibility(
              visible: !isCreate,
              child: InkWell(
                onTap: onPressedFavorite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CookieSvg(
                      svg: IconsSvgEnum.heart,
                      height: 20,
                      color:
                          isFavorite
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(height: 5),
                    CookieText(
                      text:
                          AppLocalizations.of(context)!.recipeIntroduceFavorite,
                      color:
                          isFavorite
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
