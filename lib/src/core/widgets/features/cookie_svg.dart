import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CookieSvg extends StatelessWidget {
  final IconsSvgEnum svg;
  final Color? color;
  final double? height;
  const CookieSvg({super.key, required this.svg, this.color, this.height});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svg.path,
      fit: BoxFit.scaleDown,
      height: height,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).colorScheme.onPrimary,
        BlendMode.srcIn,
      ),
    );
  }
}
