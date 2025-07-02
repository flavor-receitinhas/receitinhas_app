import 'package:app_receitas/src/core/widgets/features/cookie_snack_bar.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/select_image_recipe.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSelectImagesRecipe extends StatefulWidget {
  final CreateRecipeController ct;
  final CarouselSliderController carouselController;
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
  int _currentIndex = 0;

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
        child: Stack(
          children: [
            CarouselSlider(
              carouselController: widget.carouselController,
              options: CarouselOptions(
                height: 250,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items:
                  images.asMap().entries.map((entry) {
                    final provider = entry.value;
                    return GestureDetector(
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
                      child: Center(child: Image(image: provider)),
                    );
                  }).toList(),
            ),
            if (_currentIndex != images.length - 1)
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  size: 35,
                  Icons.keyboard_arrow_right,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            if (_currentIndex != 0)
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  size: 35,
                  Icons.keyboard_arrow_left,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            if (images.isNotEmpty)
              Positioned(
                top: 8,
                right: 8,
                child: Builder(
                  builder: (context) {
                    final currentProvider = images[_currentIndex];
                    if (currentProvider is FileImage) {
                      return IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black54,
                        ),
                        color: Theme.of(context).colorScheme.onPrimary,
                        onPressed: () {
                          setState(() {
                            ct.removeImage(currentProvider.file);
                            if (_currentIndex >= images.length - 1) {
                              _currentIndex = (images.length - 2).clamp(
                                0,
                                images.length - 1,
                              );
                            }
                          });
                        },
                        icon: const Icon(Icons.delete),
                      );
                    }
                    if (ct.isEditRecipe && currentProvider is NetworkImage) {
                      return IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black54,
                        ),
                        color: Theme.of(context).colorScheme.onPrimary,
                        onPressed: () {
                          setState(() {
                            ct.deleteImage(ct.recipe!.id!, _currentIndex);
                            if (_currentIndex >= images.length - 1) {
                              _currentIndex = (images.length - 2).clamp(
                                0,
                                images.length - 1,
                              );
                            }
                          });
                        },
                        icon: const Icon(Icons.delete),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
