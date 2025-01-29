import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color? colorContainer;
  final Color? colorBorder;
  final double? topRight;
  const CustomContainer(
      {super.key,
      required this.child,
      this.colorContainer,
      this.colorBorder,
      this.topRight});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: const Radius.circular(10),
        topLeft: const Radius.circular(10),
        topRight: Radius.circular(topRight ?? 30),
        bottomRight: const Radius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorContainer ?? Theme.of(context).colorScheme.secondary,
          border: Border(
            left: BorderSide(
              color: colorBorder ?? Theme.of(context).colorScheme.primary,
              width: 20,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
