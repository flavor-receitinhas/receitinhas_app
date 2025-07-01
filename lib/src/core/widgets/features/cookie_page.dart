import 'package:app_receitas/src/core/widgets/features/pages/cookie_page_error.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class CookiePage extends StatelessWidget {
  final Widget Function() done;
  final StateManager state;
  final Widget Function()? loading;
  final String error;
  final void Function() errorReload;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  const CookiePage({
    super.key,
    required this.state,
    required this.done,
    required this.error,
    this.loading,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
    required this.errorReload,
  });

  @override
  Widget build(BuildContext context) {
    return ManagerPageBuilder(
      state: state,
      error: error,
      bottomNavigationBar: SafeArea(
        child: bottomNavigationBar ?? const SizedBox.shrink(),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      appBar: appBar,
      pageDone: done,
      pageInitial:
          () => Center(
            child:
                loading != null
                    ? loading!()
                    : const CircularProgressIndicator(),
          ),
      pageError:
          (_) => CookiePageError(errorMessage: error, onReload: errorReload),
      pageDisconnected:
          () => CookiePageError(errorMessage: error, onReload: errorReload),
      pageLoading:
          () => Center(
            child:
                loading != null
                    ? loading!()
                    : const CircularProgressIndicator(),
          ),
      pageLoggedOut:
          () => CookiePageError(errorMessage: error, onReload: errorReload),
      pageMaintenance:
          () => CookiePageError(errorMessage: error, onReload: errorReload),
    );
  }
}
