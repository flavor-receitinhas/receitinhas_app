import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class IntroduceCreatePage extends StatefulWidget {
  final CreateRecipeController ct;
  const IntroduceCreatePage({super.key, required this.ct});

  @override
  State<IntroduceCreatePage> createState() => _IntroduceCreatePageState();
}

class _IntroduceCreatePageState extends State<IntroduceCreatePage> {
  CreateRecipeController get ct => widget.ct;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CookieButton(
        label: 'Proximo',
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        onPressed: () {
          ct.pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                CookieButton(
                  prefix: const Icon(Icons.chevron_left, size: 28),
                  label: "Voltar",
                  onPressed: () {
                    CookieSheetBottom(
                      title: CookieText(
                        text: 'Deseja descartar sua receita ?',
                        color: Theme.of(context).colorScheme.onSecondary,
                        typography: CookieTypography.title,
                      ),
                      body: Column(children: [
                        CookieText(
                          text:
                              'Ao descartar, não podemos recuperar o que foi escrito na sua receita.',
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        const SizedBox(height: 10),
                        CookieButton.outline(
                          label: 'Continuar escrevendo',
                          labelColor: Theme.of(context).colorScheme.onSecondary,
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(height: 10),
                        CookieButton(
                          label: 'Descartar receita',
                          labelColor: Theme.of(context).colorScheme.onPrimary,
                          backgroundColor: Colors.red,
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              CustomBottomBar.route,
                              (route) => false,
                            );
                          },
                        )
                      ]),
                    ).show(context);
                  },
                ).back(context),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ct.pickMultiMedia();
                          });
                        },
                        child: ct.listMultiMedia.isEmpty
                            ? Container(
                                height: 200,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.image_sharp),
                              )
                            : FlutterCarousel(
                                options: CarouselOptions(
                                  height: 250,
                                  showIndicator: true,
                                  autoPlay: false,
                                  viewportFraction: 1,
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 500),
                                  padEnds: false,
                                ),
                                items: ct.listMultiMedia
                                    .map(
                                      (e) => Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Image.file(e),
                                          IconButton(
                                            onPressed: () {
                                              ct.removeImage(e);
                                            },
                                            icon: const Icon(Icons.delete),
                                          )
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                      ),
                      const SizedBox(height: 20),
                      CookieTextField.outline(
                        hintText: 'Titulo da receita',
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                        controller: ct.titleController,
                        validator: (value) {
                          if (value!.isNotEmpty && value.length < 3) {
                            return 'Escreva um titulo, com no minimo 3 letras';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CookieTextField.outline(
                        hintText: 'Subtitulo da receita',
                        controller: ct.subTitleController,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const CookieText(
                        text: 'Sobre a receita',
                        typography: CookieTypography.title,
                      ),
                      const SizedBox(height: 20),
                      CookieTextField.outline(
                        hintText: 'Fale um pouco da sua receita aqui...',
                        controller: ct.detailsController,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
