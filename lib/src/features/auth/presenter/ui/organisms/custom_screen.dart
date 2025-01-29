import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  final IconButton iconAppBar;
  final MainAxisAlignment? sideAppBar;

  final Widget body;
  final List<Widget>? bottomBar;

  const CustomScreen({
    super.key,
    required this.iconAppBar,
    this.sideAppBar,
    required this.body,
    this.bottomBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: bottomBar ?? [],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: sideAppBar ?? MainAxisAlignment.end,
                children: [
                  iconAppBar,
                ],
              ),
              const Spacer(),
              body,
            ],
          ),
        ),
      ),
    );
  }
}
