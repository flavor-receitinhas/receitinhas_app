import 'package:flutter/material.dart';

class SelectImageRecipe extends StatelessWidget {
  final void Function() onTap;
  final Widget child;
  final dynamic image;
  final bool hasImage;
  const SelectImageRecipe(
      {super.key,
      required this.onTap,
      required this.child,
      required this.image,
      required this.hasImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: hasImage
          ? child
          : Container(
              height: 200,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.image_sharp),
            ),
    );
  }
}
