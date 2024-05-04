import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:flutter/material.dart';

class CustomSlide extends StatefulWidget {
  const CustomSlide({super.key});

  @override
  State<CustomSlide> createState() => _CustomSlideState();
}

class _CustomSlideState extends State<CustomSlide> {
  var selectRange = const RangeValues(5, 300);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Row(
      children: [
        const CookieText(text: '5'),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 1.5,
              valueIndicatorColor: theme.primary,
            ),
            child: RangeSlider(
              inactiveColor: theme.onPrimary,
              divisions: 295,
              values: selectRange,
              labels: RangeLabels(
                  '${selectRange.start.round()}', '${selectRange.end.round()}'),
              onChanged: (value) {
                setState(() {
                  selectRange = value;
                });
              },
              min: 5,
              max: 300,
              activeColor: theme.primary,
            ),
          ),
        ),
        const CookieText(text: '300'),
      ],
    );
  }
}
