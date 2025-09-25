import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:flutter/material.dart';

class CardInfoRecipe extends StatelessWidget {
  final IconsSvgEnum icon;
  final String label;
  const CardInfoRecipe({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CookieSvg(
            svg: icon,
            height: 14,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          const SizedBox(width: 5),
          CookieText(
            text: label,
            typography: CookieTypography.tiny,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ],
      ),
    );
  }
}
