import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class StylesConsts 
{
  static const TextStyle titleText = TextStyle
  (
    color: AppColors.yellowColor, 
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle midTitleText = TextStyle
  (
    color: AppColors.yellowColor, 
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle lightMidTitleText = TextStyle
  (
    color: AppColors.lightYellowColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}