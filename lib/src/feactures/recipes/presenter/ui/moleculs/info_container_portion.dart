import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoContainerPortion extends StatelessWidget {
  const InfoContainerPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          CookieText(
            text: 'Porções',
            typography: CookieTypography.title,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          CookieText(
            text: 'Quantas porções sua receita pode servir?',
            typography: CookieTypography.button,
            color: Theme.of(context).colorScheme.onSecondary,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/pot.svg',
                height: 70,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onSecondary,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          CookieButton(
            label: 'Salvar',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
