import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:flutter/material.dart';

class SelectContainerPreference extends StatefulWidget {
  final List<String> listPreference;
  final String preference;
  final String title;

  const SelectContainerPreference({
    super.key,
    required this.title,
    required this.listPreference,
    required this.preference,
  });

  @override
  State<SelectContainerPreference> createState() =>
      _SelectContainerPreferenceState();
}

class _SelectContainerPreferenceState extends State<SelectContainerPreference> {
  @override
  Widget build(BuildContext context) {
    final title = widget.title;
    final theme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        setState(() {
          widget.listPreference.contains(widget.preference)
              ? widget.listPreference.remove(widget.preference)
              : widget.listPreference.add(widget.preference);
        });
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: widget.listPreference.contains(widget.preference) ? theme.primary : null,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: widget.listPreference.contains(widget.preference)
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
