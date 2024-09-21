import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_snack_bar.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/leave_recipe_sheet.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/select_image_recipe.dart';
import 'package:flutter/material.dart';

class IntroduceCreatePage extends StatefulWidget {
  final CreateRecipeController ct;
  const IntroduceCreatePage({super.key, required this.ct});

  @override
  State<IntroduceCreatePage> createState() => _IntroduceCreatePageState();
}

class _IntroduceCreatePageState extends State<IntroduceCreatePage> {
  CreateRecipeController get ct => widget.ct;
  final formKey = GlobalKey<FormState>();
  final _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CookieButton(
        label: 'Proximo',
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        onPressed: () {
          if (formKey.currentState!.validate() &&
              ct.listImagesRecipe.isNotEmpty) {
            ct.pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }
          if (ct.listImagesRecipe.isEmpty) {
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
                CookieButton(
                  prefix: const Icon(Icons.chevron_left, size: 28),
                  label: "Voltar",
                  onPressed: () {
                    ct.showDialogDiscard()
                        ? CookieSheetBottom(
                            title: CookieText(
                              text: 'Deseja descartar sua receita ?',
                              color: Theme.of(context).colorScheme.onSecondary,
                              typography: CookieTypography.title,
                            ),
                            body: const LeaveRecipeSheet(),
                          ).show(context)
                        : Navigator.pushNamedAndRemoveUntil(
                            context,
                            CustomBottomBar.route,
                            (route) => false,
                          );
                  },
                ).back(context),
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
                        hasImage: ct.listImagesRecipe.isNotEmpty,
                        image: ct.listImagesRecipe,
                        onTap: () async {
                          final images = await ct.pickMultiImagesRecipe();
                          for (var i = 0; i < images.length; i++) {
                            if (ct.listImagesRecipe.length < 10) {
                              ct.listImagesRecipe.add(images[i]);
                            } else {
                              if (context.mounted) {
                                const CookieSnackBar(
                                  text: 'Só é permitido 10 imagens por receita',
                                ).show(context);
                              }
                              break;
                            }
                          }
                          setState(() {});
                        },
                        child: SizedBox(
                          height: 250,
                          child: CarouselView(
                            controller: _carouselController,
                            onTap: (value) async {
                              final images = await ct.pickMultiImagesRecipe();
                              for (var i = 0; i < images.length; i++) {
                                if (ct.listImagesRecipe.length < 10) {
                                  ct.listImagesRecipe.add(images[i]);
                                } else {
                                  if (context.mounted) {
                                    const CookieSnackBar(
                                      text:
                                          'Só é permitido 10 imagens por receita',
                                    ).show(context);
                                  }
                                  break;
                                }
                              }
                              setState(() {});
                            },
                            itemExtent: 500,
                            itemSnapping: true,
                            shrinkExtent: 50,
                            children: ct.listImagesRecipe
                                .map(
                                  (e) => Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Center(child: Image.file(e)),
                                      IconButton(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        onPressed: () {
                                          setState(() {
                                            ct.removeImage(e);
                                          });
                                        },
                                        icon: const Icon(Icons.delete),
                                      ),
                                      if (e != ct.listImagesRecipe.last)
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            size: 35,
                                            Icons.keyboard_arrow_right,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                        ),
                                      if (e != ct.listImagesRecipe.first)
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Icon(
                                            size: 35,
                                            Icons.keyboard_arrow_left,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
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
                          onTap: () async {
                            await ct.pickThumb();
                            setState(() {});
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
                        maxLength: 50,
                        maxLines: 1,
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
                        maxLength: 100,
                        maxLines: 3,
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
