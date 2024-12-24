import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class StylesConsts 
{
  static const TextStyle darkTextLg = TextStyle
  (
    color: AppColors.blackColor, 
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
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

  static const TextStyle yellowTextXs = TextStyle
  (
    color: AppColors.yellowColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle lightMidTitleText = TextStyle
  (
    color: AppColors.lightYellowColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle whiteTextXs = TextStyle
  (
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle whiteTextLg = TextStyle
  (
    color: AppColors.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
}