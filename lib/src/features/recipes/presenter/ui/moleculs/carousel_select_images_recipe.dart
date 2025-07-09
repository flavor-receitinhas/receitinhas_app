import 'dart:io';

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
    return SelectImageRecipe(
      hasImage: ct.listImagesRecipe.isNotEmpty,
      image: ct.listImagesRecipe,
      onTap: () async {
        final picked = await ct.pickMultiImagesRecipe();
        for (var i = 0; i < picked.length; i++) {
          if (ct.listImagesRecipe.length < 10) {
            ct.listImagesRecipe.add(picked[i].path);
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
                  ct.listImagesRecipe.map((entry) {
                    return GestureDetector(
                      onTap: () async {
                        final picked = await ct.pickMultiImagesRecipe();
                        for (var i = 0; i < picked.length; i++) {
                          if (ct.listImagesRecipe.length < 10) {
                            ct.listImagesRecipe.add(picked[i].path);
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
                      child: Center(
                        child:
                            ct.validateStringIsUrl(entry)
                                ? Image.network(entry, fit: BoxFit.cover)
                                : Image.file(File(entry), fit: BoxFit.cover),
                      ),
                    );
                  }).toList(),
            ),
            if (_currentIndex != ct.listImagesRecipe.length - 1)
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
            if (ct.listImagesRecipe.isNotEmpty)
              Positioned(
                top: 8,
                right: 8,
                child: Builder(
                  builder: (context) {
                    return IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black54,
                      ),
                      color: Theme.of(context).colorScheme.onPrimary,
                      onPressed: () {
                        setState(() {
                          ct.validateStringIsUrl(
                                ct.listImagesRecipe[_currentIndex],
                              )
                              ? ct.listImagesRecipe.removeAt(_currentIndex)
                              : ct.removeImage(
                                ct.listImagesRecipe[_currentIndex],
                              );
                          if (_currentIndex >= ct.listImagesRecipe.length - 1) {
                            _currentIndex = (ct.listImagesRecipe.length - 2)
                                .clamp(0, ct.listImagesRecipe.length - 1);
                          }
                        });
                      },
                      icon: const Icon(Icons.delete),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
