import 'package:flutter/material.dart';

enum PageState { loading, done, error }

class CookiePage extends StatelessWidget {
  final Widget Function(BuildContext) done;
  final PageState state;
  final Widget? loading;
  final Widget? error;
  const CookiePage({
    super.key,
    required this.state,
    required this.done,
    this.error,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return switch (state) {
            PageState.loading => loading ?? const CircularProgressIndicator(),
            PageState.done => done(context),
            PageState.error =>
              error ?? const Text('Error') // TODO: Criar tela padrão de erro
          };
        },
      ),
    );
  }
}
