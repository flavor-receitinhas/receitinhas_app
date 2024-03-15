import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectIngredientContainer extends StatelessWidget {
  const SelectIngredientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CustomContainer(
        topRight: 10,
        colorBorder: theme.onPrimary,
        colorContainer: theme.primary,
        child: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CookieText(
                    text: 'Salada de Legumes',
                    typography: CookieTypography.button,
                    maxLine: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  CookieText(
                    text: '2 unidades',
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/delete.svg',
                colorFilter: ColorFilter.mode(
                  theme.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
