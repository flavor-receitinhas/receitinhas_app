import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:flutter/material.dart';

class ContainerFilter extends StatelessWidget {
  final String text;
  const ContainerFilter({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: true ? theme.primary : Colors.transparent,
        border: Border.all(color: theme.onPrimary, width: true ? 0 : 1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: CookieText(
          text: text,
          color: true ? theme.onSecondary : theme.onPrimary,
        ),
      ),
    );
  }
}
