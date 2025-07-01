import 'package:app_receitas/src/core/widgets/features/cookie_snack_bar.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/select_image_recipe.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class CarouselSelectImagesRecipe extends StatefulWidget {
  final CreateRecipeController ct;
  final CarouselController carouselController;
  const CarouselSelectImagesRecipe({
    super.key,
    required this.ct,
    required this.carouselController,
  });

  @override
  State<CarouselSelectImagesRecipe> createState() =>
      _CarouselSelectImagesRecipeState();
}

class _CarouselSelectImagesRecipeState
    extends State<CarouselSelectImagesRecipe> {
  @override
  void initState() {
    super.initState();
    widget.ct.addListener(_listener);
  }

  void _listener() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    widget.ct.removeListener(_listener);
    super.dispose();
  }

  CreateRecipeController get ct => widget.ct;
  @override
  Widget build(BuildContext context) {
    final List<ImageProvider<Object>> images = [
      ...ct.listImagesRecipeSelected.map((e) => NetworkImage(e.link)),
      ...ct.listImagesRecipe.map((e) => FileImage(e)),
    ];
    return SelectImageRecipe(
      hasImage: images.isNotEmpty,
      image: images,
      onTap: () async {
        final picked = await ct.pickMultiImagesRecipe();
        for (var i = 0; i < picked.length; i++) {
          if (ct.listImagesRecipe.length < 10) {
            ct.listImagesRecipe.add(picked[i]);
          } else {
            if (context.mounted) {
              CookieSnackBar(
                text:
                    AppLocalizations.of(
                      context,
                    )!.recipeCarouselSelectImagesRecipeMaxImages,
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
            final picked = await ct.pickMultiImagesRecipe();
            for (var i = 0; i < picked.length; i++) {
              if (ct.listImagesRecipe.length < 10) {
                ct.listImagesRecipe.add(picked[i]);
              } else {
                if (context.mounted) {
                  CookieSnackBar(
                    text:
                        AppLocalizations.of(
                          context,
                        )!.recipeCarouselSelectImagesRecipeMaxImages,
                  ).show(context);
                }
                break;
              }
            }
            setState(() {});
          },
          itemExtent: 500,
          itemSnapping: true,
          children:
              images.asMap().entries.map((entry) {
                final index = entry.key;
                final provider = entry.value;
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Center(child: Image(image: provider)),
                    if (provider is FileImage)
                      IconButton(
                        color: Theme.of(context).colorScheme.onPrimary,
                        onPressed: () {
                          setState(() {
                            ct.removeImage(provider.file);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    if (ct.isEditRecipe && provider is NetworkImage)
                      IconButton(
                        color: Theme.of(context).colorScheme.onPrimary,
                        onPressed: () {
                          setState(() {
                            ct.deleteImage(ct.recipe!.id!, index);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    if (index != images.length - 1)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          size: 35,
                          Icons.keyboard_arrow_right,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    if (index != 0)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          size: 35,
                          Icons.keyboard_arrow_left,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
