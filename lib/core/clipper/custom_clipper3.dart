import 'package:flutter/material.dart';

class CustomCurveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height * .7); 
    path.quadraticBezierTo(
      size.width * .5, 
      size.height * 1.2, 
      size.width, 
      size.height * .7,
    );
    path.lineTo(size.width, 0); 
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}