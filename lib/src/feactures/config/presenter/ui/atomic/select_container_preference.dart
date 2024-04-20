import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:flutter/material.dart';

class SelectContainerPreference extends StatelessWidget {
  final List<Enum> listPreference;
  final Enum preference;
  final String title;
  final void Function()? onTap;
  const SelectContainerPreference({
    super.key,
    required this.title,
    required this.listPreference,
    required this.preference,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: listPreference.contains(preference) ? theme.primary : null,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: listPreference.contains(preference)
                    ? theme.primary
                    : const Color.fromARGB(255, 255, 255, 255),
                width: 2,
              ),
            ),
          ),
          const SizedBox(width: 12),
          CookieText(
            text: title,
            color: theme.onPrimary,
          )
        ],
      ),
    );
  }
}
