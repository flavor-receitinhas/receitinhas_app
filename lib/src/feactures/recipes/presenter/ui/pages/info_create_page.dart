import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/image_context.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoCreatePage extends StatelessWidget {
  const InfoCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CookieButton(
              label: 'Voltar',
              onPressed: () {},
            ).back(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CookieText(
                    text: 'Personalize informações básicas',
                    typography: CookieTypography.title,
                  ),
                  const SizedBox(height: 10),
                  const CookieText(
                    text:
                        'Essas informações vão ajudar a indentificar coisas básicas da sua receita, então seja bem consiso.',
                  ),
                  const SizedBox(height: 20),
                  CustomContainer(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
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
                ],
              ),
            ),
            const Spacer(),
            // Container(
            //   width: MediaQuery.sizeOf(context).width,
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).colorScheme.onPrimary,
            //     borderRadius: const BorderRadius.only(
            //         topLeft: Radius.circular(20),
            //         topRight: Radius.circular(20)),
            //   ),
            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            //   child: Column(
            //     children: [
            //       CookieText(
            //         text: 'Tempo de preparo',
            //         typography: CookieTypography.title,
            //         color: Theme.of(context).colorScheme.onSecondary,
            //       ),
            //       CookieButton(
            //         label: 'Proximo',
            //         onPressed: () {},
            //       ),
            //     ],
            //   ),
            // )
            // Container(
            //   width: MediaQuery.sizeOf(context).width,
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).colorScheme.onPrimary,
            //     borderRadius: const BorderRadius.only(
            //         topLeft: Radius.circular(20),
            //         topRight: Radius.circular(20)),
            //   ),
            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            //   child: Column(
            //     children: [
            //       CookieText(
            //         text: 'Dificuldade',
            //         typography: CookieTypography.title,
            //         color: Theme.of(context).colorScheme.onSecondary,
            //       ),
            //       Column(
            //         children: DifficultyRecipe.values
            //             .map(
            //               (e) => Padding(
            //                 padding: const EdgeInsets.only(bottom: 20),
            //                 child: CookieButton(
            //                   label: 'Facil e rápido',
            //                   prefix: SvgPicture.asset(
            //                     ImageContext().svgIconDifficulty(e),
            //                     colorFilter: ColorFilter.mode(
            //                       Theme.of(context).colorScheme.onPrimary,
            //                       BlendMode.srcIn,
            //                     ),
            //                   ),
            //                   backgroundColor:
            //                       Theme.of(context).colorScheme.onSecondary,
            //                   labelColor:
            //                       Theme.of(context).colorScheme.onPrimary,
            //                 ),
            //               ),
            //             )
            //             .toList(),
            //       ),
            //       CookieButton(
            //         label: 'Proximo',
            //         onPressed: () {},
            //       ),
            //     ],
            //   ),
            // )
            Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
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
                    label: 'Proximo',
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
