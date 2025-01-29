import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:flutter/material.dart';

class CookieSlide extends StatelessWidget {
  final double minRange;
  final double maxRange;
  final RangeValues selectRange;
  final RangeLabels? labels;
  final String? textLabelEnd;
  final String? textLabelStart;

  final void Function(RangeValues)? onChanged;

  const CookieSlide({
    super.key,
    required this.minRange,
    required this.maxRange,
    required this.selectRange,
    required this.onChanged,
    required this.labels,
    this.textLabelEnd,
    this.textLabelStart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Row(
      children: [
        CookieText(text: textLabelStart ?? minRange.truncate().toString()),
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
              labels: labels,
              onChanged: onChanged,
              min: minRange,
              max: maxRange,
              activeColor: theme.primary,
            ),
          ),
        ),
        CookieText(
          text: textLabelEnd ?? maxRange.truncate().toString(),
        ),
      ],
    );
  }
}
