import 'package:app_receitas/src/core/widgets/feactures/cookie_snack_bar.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/select_image_recipe.dart';
import 'package:flutter/material.dart';

class CarouselSelectImagesRecipe extends StatefulWidget {
  final CreateRecipeController ct;
  final CarouselController carouselController;
  const CarouselSelectImagesRecipe(
      {super.key, required this.ct, required this.carouselController});

  @override
  State<CarouselSelectImagesRecipe> createState() =>
      _CarouselSelectImagesRecipeState();
}

class _CarouselSelectImagesRecipeState
    extends State<CarouselSelectImagesRecipe> {
  @override
  Widget build(BuildContext context) {
    return SelectImageRecipe(
      hasImage: widget.ct.listImagesRecipe.isNotEmpty,
      image: widget.ct.listImagesRecipe,
      onTap: () async {
        final images = await widget.ct.pickMultiImagesRecipe();
        for (var i = 0; i < images.length; i++) {
          if (widget.ct.listImagesRecipe.length < 10) {
            widget.ct.listImagesRecipe.add(images[i]);
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
          controller: widget.carouselController,
          onTap: (value) async {
            final images = await widget.ct.pickMultiImagesRecipe();
            for (var i = 0; i < images.length; i++) {
              if (widget.ct.listImagesRecipe.length < 10) {
                widget.ct.listImagesRecipe.add(images[i]);
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
          itemExtent: 500,
          itemSnapping: true,
          children: widget.ct.listImagesRecipe
              .map(
                (e) => Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Center(child: Image.file(e)),
                    IconButton(
                      color: Theme.of(context).colorScheme.onPrimary,
                      onPressed: () {
                        setState(() {
                          widget.ct.removeImage(e);
                        });
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    if (e != widget.ct.listImagesRecipe.last)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          size: 35,
                          Icons.keyboard_arrow_right,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    if (e != widget.ct.listImagesRecipe.first)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          size: 35,
                          Icons.keyboard_arrow_left,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
