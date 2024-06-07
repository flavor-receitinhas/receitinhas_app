import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/arc_clipper.dart';
import 'package:flutter/material.dart';

class ContainerIngredient extends StatelessWidget {
  final Widget body;
  final Widget icon;
  final void Function() onTap;
  const ContainerIngredient(
      {super.key, required this.body, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: ClipPath(
              clipper: ArcClipper(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: theme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: body,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: theme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(onTap: onTap, child: icon),
          ),
        ],
      ),
    );
  }
}
