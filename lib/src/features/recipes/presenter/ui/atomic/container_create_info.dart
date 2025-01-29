import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';

class ContainerCreateInfo extends StatelessWidget {
  final String? title;
  final IconsSvgEnum svg;
  final Widget child;
  const ContainerCreateInfo(
      {super.key, this.title, required this.svg, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CookieText(
                text: title ?? '',
                typography: CookieTypography.button,
              ),
              CookieSvg(svg: svg),
            ],
          ),
          const SizedBox(height: 10),
          child
        ],
      ),
    );
  }
}
