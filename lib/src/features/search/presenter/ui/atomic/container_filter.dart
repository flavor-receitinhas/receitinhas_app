import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:flutter/material.dart';

class ContainerFilter extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool isSelect;
  const ContainerFilter(
      {super.key, required this.text, this.onTap, required this.isSelect});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: isSelect ? theme.primary : Colors.transparent,
          border: Border.all(color: theme.onPrimary, width: isSelect ? 0 : 1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: CookieText(
            text: text,
            color: isSelect ? theme.onSecondary : theme.onPrimary,
          ),
        ),
      ),
    );
  }
}
