import 'package:flutter/material.dart';

enum PageState { loading, done, error }

class CookiePage extends StatelessWidget {
  final Widget Function(BuildContext) done;
  final PageState state;
  final Widget Function(BuildContext)? loading;
  final Widget Function(BuildContext)? error;
  final PreferredSizeWidget? appBar;
  const CookiePage({
    super.key,
    required this.state,
    required this.done,
    this.error,
    this.loading,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Builder(
        builder: (context) {
          return switch (state) {
            PageState.loading => loading != null
                ? loading!(context)
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            PageState.done => done(context),
            PageState.error => error != null
                ? error!(context)
                : const Text('Error') // TODO: Criar tela padrão de erro
          };
        },
      ),
    );
  }
}
