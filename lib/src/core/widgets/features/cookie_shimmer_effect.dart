import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CookieShimmerEffect extends StatelessWidget {
  final double height;
  final double width;
  const CookieShimmerEffect({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[900]!,
      highlightColor: Theme.of(context).colorScheme.primary,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        height: height,
        width: width,
      ),
    );
  }
}
