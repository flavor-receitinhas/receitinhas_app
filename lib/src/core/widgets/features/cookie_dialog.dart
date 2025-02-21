import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CookieDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final void Function()? onPressedConfirm;
  final void Function()? onPressedRecused;
  const CookieDialog(
      {super.key,
      this.title,
      this.content,
      this.onPressedConfirm,
      this.onPressedRecused});

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CookieDialog(
          title: title,
          content: content,
          onPressedConfirm: onPressedConfirm,
          onPressedRecused: onPressedRecused,
        );
      },
    );
  }

  void error(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CookieDialog(
          title: CookieText(
            text: AppLocalizations.of(context)!.dialogUnexpectedError,
          ),
          content: content,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: [
        CookieTextButton(
          onPressed: () {
            onPressedRecused ?? Navigator.of(context).pop();
          },
          text: onPressedConfirm != null
              ? AppLocalizations.of(context)!.dialogNo
              : AppLocalizations.of(context)!.dialogOk,
        ),
        if (onPressedConfirm != null) const SizedBox(width: 10),
        if (onPressedConfirm != null)
          CookieTextButton(
            onPressed: onPressedConfirm,
            text: AppLocalizations.of(context)!.dialogYes,
          ),
      ],
    );
  }
}
