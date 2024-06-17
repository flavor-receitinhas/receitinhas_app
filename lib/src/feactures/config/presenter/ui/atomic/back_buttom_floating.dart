import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:flutter/material.dart';

class BackButtomFloating extends StatelessWidget {
  final String label;
  const BackButtomFloating({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: CookieButton(label: label).back(context),
      automaticallyImplyLeading: false,
      floating: true,
      titleSpacing: 0,
      surfaceTintColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Colors.transparent,
    );
  }
}
