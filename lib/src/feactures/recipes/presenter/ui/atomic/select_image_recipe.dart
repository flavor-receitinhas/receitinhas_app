import 'package:flutter/material.dart';

class SelectImageRecipe extends StatefulWidget {
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
  State<SelectImageRecipe> createState() => _SelectImageRecipeState();
}

class _SelectImageRecipeState extends State<SelectImageRecipe> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: widget.hasImage
          ? widget.child
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
