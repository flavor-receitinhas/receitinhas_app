import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ViewDetailsRecipe extends StatelessWidget {
  const ViewDetailsRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CookieText(
          text: 'Detalhes da receita',
          typography: CookieTypography.title,
        ),
        const SizedBox(height: 20),
        const CookieText(
          text:
              'Lorem ipsum dolor sit amet consectetur. Sodales donec non tortor augue eros massa feugiat. Odio vitae montes in pharetra ac. Pulvinar dignissim accumsan bibendum enim id enim eu vitae viverra. In massa erat tristique mauris consequat habitant aenean orci lacus.',
        ),
        const SizedBox(height: 20),
        CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CookieText(
                    text: 'Ingredientes',
                    typography: CookieTypography.title,
                  ),
                  SvgPicture.asset('assets/icons/carrot.svg'),
                ],
              ),
              const SizedBox(height: 10),
              const CookieText(text: '● banana 300ml'),
              const CookieText(text: '● banana 300ml'),
              const CookieText(text: '● banana 300ml'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CustomContainer(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CookieText(
                    text: 'Instruções de preparo',
                    typography: CookieTypography.title,
                  ),
                  SvgPicture.asset('assets/icons/knife.svg'),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CookieText(
                    text: '1.',
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: CookieText(
                      text:
                          'Enxágue o arroz basmati até que a água fique clara.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: true,
          child: CustomContainer(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CookieText(
                      text: 'Hora de se servir!',
                      typography: CookieTypography.title,
                    ),
                    SvgPicture.asset('assets/icons/pan.svg'),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CookieText(
                      text: '1.',
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: CookieText(
                        text:
                            'Enxágue o arroz basmati até que a água fique clara.',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
