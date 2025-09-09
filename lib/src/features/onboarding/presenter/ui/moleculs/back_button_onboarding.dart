import 'package:flutter/material.dart';

class BackButtonOnboarding extends StatelessWidget {
  final void Function() onTap;
  const BackButtonOnboarding({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
