import 'package:app_receitas/src/core/widgets/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateAdditionalInfo extends StatelessWidget {
  const CreateAdditionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomContainer(
          child: Row(
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/clock.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const CookieText(text: '5 min')
                ],
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/fire.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const CookieText(text: 'Dificil')
                ],
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/pot.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const CookieText(text: '5 porções')
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                CookieSheetBottom(
                  title: CookieText(
                    text: 'Ajuste informações básicas',
                    color: Theme.of(context).colorScheme.onSecondary,
                    typography: CookieTypography.title,
                  ),
                  body: const Column(
                    children: [],
                  ),
                ).show(context);
              },
              child: SvgPicture.asset(
                'assets/icons/edit.svg',
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const CookieText(text: 'Editar seção')
          ],
        ),
      ],
    );
  }
}
