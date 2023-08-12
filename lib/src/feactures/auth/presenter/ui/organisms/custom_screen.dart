import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  final IconButton iconAppBar;
  final MainAxisAlignment? sideAppBar;
  final String image;
  final String backgroundImage;
  final Widget body;
  final Widget? bottomBar;

  const CustomScreen(
      {super.key,
      required this.iconAppBar,
      required this.image,
      required this.backgroundImage,
      this.sideAppBar,
      required this.body,
      this.bottomBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: NetworkImage(backgroundImage),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
                    const SizedBox(height: 20),
                    Center(
                      child: Image.network(
                        image,
                        height: 300,
                      ),
                    ),
                    const SizedBox(height: 20),
                    body,
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: bottomBar ?? const SizedBox.shrink(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
