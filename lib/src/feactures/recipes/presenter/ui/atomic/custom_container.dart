import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  const CustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        topLeft: Radius.circular(10),
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          border: Border(
            left: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 20,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
