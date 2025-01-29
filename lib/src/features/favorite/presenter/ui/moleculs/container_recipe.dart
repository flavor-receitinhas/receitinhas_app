import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:flutter/material.dart';

class ContainerRecipe extends StatelessWidget {
  final String nameRecipe;
  final String? imageRecipe;
  final int timePrepared;
  final void Function() onPressedFavorite;
  const ContainerRecipe(
      {super.key,
      required this.nameRecipe,
      required this.imageRecipe,
      required this.timePrepared,
      required this.onPressedFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(right: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.network(
            imageRecipe ?? Global.imageRecipeDefault,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CookieText(
                  text: nameRecipe,
                  maxLine: 1,
                  overflow: TextOverflow.ellipsis,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                CookieText(
                  text: Global().formatTime(
                    timePrepared.toDouble(),
                  ),
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onPressedFavorite,
            icon: CookieSvg(
              svg: IconsSvgEnum.heart,
              color: Theme.of(context).colorScheme.primary,
              height: 36,
            ),
          ),
        ],
      ),
    );
  }
}
