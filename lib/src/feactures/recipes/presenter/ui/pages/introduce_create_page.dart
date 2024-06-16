import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_snack_bar.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/back_button_introduce_create.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/select_image_recipe.dart';
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
          if (formKey.currentState!.validate() &&
              ct.listMultiMedia.isNotEmpty) {
            ct.pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }
          if (ct.listMultiMedia.isEmpty) {
            const CookieSnackBar(text: 'Adicione uma imagem da receita')
                .show(context);

            return;
          }
          if (ct.thumbImage == null) {
            const CookieSnackBar(text: 'Adicione uma imagem de capa')
                .show(context);
            return;
          }
          if (!formKey.currentState!.validate()) {
            const CookieSnackBar(
              text: 'Preencha todos os campos corretamente',
            );
            return;
          }
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
                const BackButtonIntroduceCreate(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CookieText(
                        text: 'Fotos da receita',
                        typography: CookieTypography.title,
                      ),
                      const SizedBox(height: 10),
                      SelectImageRecipe(
                        hasImage: ct.listMultiMedia.isNotEmpty,
                        image: ct.listMultiMedia,
                        onTap: () {
                          setState(() {
                            ct.pickMultiMedia();
                          });
                        },
                        child: FlutterCarousel(
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
                      const CookieText(
                        text: 'Capa da receita',
                        typography: CookieTypography.title,
                      ),
                      const SizedBox(height: 10),
                      SelectImageRecipe(
                          hasImage: ct.thumbImage != null,
                          onTap: () {
                            setState(() {
                              ct.pickThumb();
                            });
                          },
                          image: ct.thumbImage,
                          child: Center(
                            child: ct.thumbImage != null
                                ? Image.file(
                                    ct.thumbImage!,
                                    height: 250,
                                  )
                                : const SizedBox.shrink(),
                          )),
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
                          if (value!.isEmpty || value.length < 3) {
                            return 'Escreva um titulo com no mínimo 3 letras';
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
                        minLines: 5,
                        maxLines: 10,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 10) {
                            return 'Escreva um pouco mais sobre a receita';
                          }
                          return null;
                        },
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
