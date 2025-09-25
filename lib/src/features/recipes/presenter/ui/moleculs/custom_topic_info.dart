import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';

class CustomTopicInfo extends StatelessWidget {
  final String title;
  final Widget child;
  const CustomTopicInfo({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CookieText(
          text: title,
          color: Theme.of(context).colorScheme.primary,
          typography: CookieTypography.title,
        ),
        const SizedBox(height: 10),
        CustomContainer(width: double.infinity, child: child),
      ],
    );
  }
}
