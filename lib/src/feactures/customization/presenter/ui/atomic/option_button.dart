import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OptionButton extends StatelessWidget {
  
  const OptionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CookieButton(
      label: AppLocalizations.of(context)!.proteinPreferenceOption1,
      onPressed: () {},
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      prefix: Icon(
        Icons.ac_unit_rounded,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      labelColor: Theme.of(context).colorScheme.onSecondary,
    );
  }
}
