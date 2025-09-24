import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final bool isVertical;

  DashedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
    required this.isVertical,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = isVertical ? size.width : size.height;

    final max = isVertical ? size.height : size.width;
    final dashPattern = dashWidth + dashSpace;
    double distance = 0;

    while (distance < max) {
      final start =
          isVertical
              ? Offset(size.width / 2, distance)
              : Offset(distance, size.height / 2);

      final end =
          isVertical
              ? Offset(size.width / 2, distance + dashWidth)
              : Offset(distance + dashWidth, size.height / 2);

      canvas.drawLine(start, end, paint);
      distance += dashPattern;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CookieLine extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final bool isVertical;
  final EdgeInsetsGeometry padding;

  const CookieLine({
    super.key,
    this.height = 1,
    required this.color,
    this.dashWidth = 10,
    this.dashSpace = 4,
    this.isVertical = false,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CustomPaint(
        size:
            isVertical
                ? Size(height, double.infinity)
                : Size(double.infinity, height),
        painter: DashedLinePainter(
          color: color,
          dashWidth: dashWidth,
          dashSpace: dashSpace,
          isVertical: isVertical,
        ),
      ),
    );
  }
}
