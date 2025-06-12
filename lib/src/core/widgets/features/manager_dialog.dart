import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/handles/manager_handle_dialog_error.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class ManagerDialog implements ManagerHandleDialogError {
  @override
  Widget call(Object? e, BuildContext context) {
    return CookieDialog(
      title: CookieText(
        text: AppLocalizations.of(context)!.dialogUnexpectedError,
      ),
      content: CookieText(
        text: e.toString().replaceFirst('Exception:', ''),
      ),
    );
  }
}
