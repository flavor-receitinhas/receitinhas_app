import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CookieSvg extends StatelessWidget {
  final String path;
  final Color? color;
  final double? height;
  const CookieSvg({super.key, required this.path, this.color, this.height});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      fit: BoxFit.scaleDown,
      height: height,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).colorScheme.onPrimary,
        BlendMode.srcIn,
      ),
    );
  }
}
