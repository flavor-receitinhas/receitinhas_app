import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  final IconButton? iconAppBar;
  final Widget? leading;

  final Widget body;
  final List<Widget>? bottomBar;

  const CustomScreen({
    super.key,
    this.iconAppBar,
    required this.body,
    this.bottomBar,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: bottomBar ?? [],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: leading,
        actions: [iconAppBar ?? const SizedBox.shrink()],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: body,
        ),
      ),
    );
  }
}
