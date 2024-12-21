import 'package:flutter/material.dart';

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height * 0.75); 
    path.quadraticBezierTo(
      size.width * 0.5, 
      size.height , 
      size.width * .9, 
      size.height * 0.4,
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
