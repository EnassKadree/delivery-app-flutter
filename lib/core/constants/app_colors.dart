import 'package:flutter/material.dart';

class AppColors 
{
  static const Color lightNavyColor =Color(0xFF004e92);
  static const Color midNavyColor =Color(0xFF00285c);
  static const Color darkNavyColor = Color(0xFF000428);

  static const Color greyColor = Color(0XFF384045);

  static const Color yellowColor = Color(0XFFbe9442);
  static const Color lightYellowColor =  Color.fromARGB(255, 224, 178, 86);
  static const Color beige = Color(0xFFdec9a0);

  static Color errorColor =  Colors.red[800]!;

  static const List<Color> gradientColors = 
  [
    Color(0xFF000428),  //1
    Color(0xFF000428),  //1
    Color(0xFF001e4e),  // PART
    Color(0xFF00285c),  //2
    Color(0xFF003b76),  // PART
    Color(0xFF004e92),  //3
  ];

  static List<Color> quotesColors =
  [
    AppColors.beige.withOpacity(0.3),
    AppColors.beige.withOpacity(0.01),
    AppColors.beige.withOpacity(0.05),
    AppColors.beige.withOpacity(0.1),
  ];
}

// OLD COLOR PALETTE

//GRADIENT:
// [
    // Color.fromARGB(255, 60, 112, 135), 
    // Color(0XFF2c5263), 
    // Color(0XFF0f2027), 
    // Color(0XFF0f2027), 
    // Color(0XFF0f2027), 
// ]

//COLORS:
// static const Color lightNavyColor =Color.fromARGB(255, 60, 112, 135);
// static const Color midNavyColor =Color(0XFF2c5263);
// static const Color darkNavyColor = Color(0XFF0f2027);