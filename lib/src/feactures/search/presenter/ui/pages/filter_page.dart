import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/atomic/container_filter.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var selectRange = const RangeValues(5, 300);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
            children: [
              CookieText(
                text: 'FILTRAR POR',
                typography: CookieTypography.title,
                color: theme.primary,
              ),
              const SizedBox(height: 20),
              const CookieText(
                text: 'Ordernar por',
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(
                    child: ContainerFilter(text: 'Popular'),
                  ),
                  Expanded(
                    child: ContainerFilter(text: 'Popular'),
                  ),
                  Expanded(
                    child: ContainerFilter(text: 'Popular'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  CookieText(text: '5'),
                  Expanded(
                    child: RangeSlider(
                      values: selectRange,
                      labels: RangeLabels(
                          '${selectRange.start}', '${selectRange.end}'),
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
                  CookieText(text: '300'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
