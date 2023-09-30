import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  final IconButton iconAppBar;
  final MainAxisAlignment? sideAppBar;
  final String image;
  final Widget body;
  final List<Widget>? bottomBar;

  const CustomScreen({
    super.key,
    required this.iconAppBar,
    required this.image,
    this.sideAppBar,
    required this.body,
    this.bottomBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: bottomBar ?? [],
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: sideAppBar ?? MainAxisAlignment.end,
                        children: [
                          iconAppBar,
                        ],
                      ),
                      const SizedBox(height: 50),
                      Center(
                        child: Image.network(
                          image,
                          height: 300,
                        ),
                      ),
                      const SizedBox(height: 50),
                      body,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
