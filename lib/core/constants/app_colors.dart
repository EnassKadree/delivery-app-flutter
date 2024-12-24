import 'package:flutter/material.dart';

abstract class AppColors 
{
  static const Color blueColor =Color(0xFF2b7a76);
  static const Color yellowColor =Color(0xFFf3af4a);
  static const Color lightYellowColor = Color(0xFFffbe5d);

  static const Color greyColor = Color(0XFFd7d7d7);
  static const Color backGroundGreyColor = Color(0XFFeaebed);
  static const Color blackColor = Color(0XFF0a1615);
  static const Color white = Color(0XFFffffff);

  static Color errorColor =  Colors.red[800]!;

  static const List<Color> blueGradient = 
  [
    blueColor,
    Color.fromARGB(255, 56, 159, 154)
  ];
}