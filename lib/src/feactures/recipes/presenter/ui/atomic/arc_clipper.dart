import 'package:flutter/material.dart';

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width * 1, 0);
    path.quadraticBezierTo(size.width * 0.94, size.height * 0.5, size.width * 1, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}