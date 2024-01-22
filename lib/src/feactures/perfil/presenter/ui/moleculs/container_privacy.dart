import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:flutter/material.dart';

class ContainerPrivacy extends StatelessWidget {
  final String text;
  const ContainerPrivacy({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.secondary,
      ),
      child: Row(
        children: [
          CookieText(text: text),
          const Spacer(),
          SizedBox(
            height: 20,
            child: Transform.scale(
              scale: 0.8,
              child: Switch(
                value: true,
                onChanged: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
