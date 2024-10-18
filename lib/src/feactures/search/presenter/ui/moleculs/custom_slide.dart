import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:flutter/material.dart';

class CustomSlide extends StatelessWidget {
  final double minRange;
  final double maxRange;
  final RangeValues selectRange;
  final void Function(RangeValues)? onChanged;

  const CustomSlide({
    super.key,
    required this.minRange,
    required this.maxRange,
    required this.selectRange,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Row(
      children: [
        CookieText(text: minRange.truncate().toString()),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 1.5,
              valueIndicatorColor: theme.primary,
            ),
            child: RangeSlider(
              inactiveColor: theme.onPrimary,
              divisions: maxRange.toInt(),
              values: selectRange,
              labels: RangeLabels(
                  '${selectRange.start.round()}', '${selectRange.end.round()}'),
              onChanged: onChanged,
              min: minRange,
              max: maxRange,
              activeColor: theme.primary,
            ),
          ),
        ),
        CookieText(
          text: maxRange.truncate().toString(),
        ),
      ],
    );
  }
}
