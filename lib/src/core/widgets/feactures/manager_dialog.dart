import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/handles/manager_handle_dialog_error.dart';

class ManagerDialog implements ManagerHandleDialogError {
  @override
  Widget call(Object? e, BuildContext context) {
    return CookieDialog(
      title: const CookieText(text: 'Ocorreu um erro inesperado!'),
      content: CookieText(
        text: e.toString().replaceFirst('Exception:', ''),
      ),
    );
  }
}
