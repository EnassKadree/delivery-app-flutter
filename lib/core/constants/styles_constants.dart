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
    //color: AppColors.lightNavyColor, 
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle lightDisplayTextSm = TextStyle
  (
    color: AppColors.yellowColor,
    //color: AppColors.darkNavyColor, 
    fontSize: 14,
  );

  static const TextStyle tabText = TextStyle
  (
    fontSize: 18,
    fontWeight: FontWeight.bold
  );

  static const TextStyle dialogTitle = TextStyle
  (
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.lightNavyColor,
    fontFamily: 'Cairo',
  );

  static TextStyle errorDialogTitle = TextStyle
  (
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.errorColor,
    fontFamily: 'Cairo',
  );

  static const TextStyle dialogContent = TextStyle
  (
    fontSize: 14,
    color: AppColors.darkNavyColor,
    fontFamily: 'Cairo',
  );

  static const TextStyle dropDownText = TextStyle
  (
    color: AppColors.midNavyColor,
    fontFamily: 'Cairo',
    fontSize: 14
  );

  static const TextStyle listTileTitle = TextStyle
  (
    color: AppColors.midNavyColor,
    fontFamily: 'Cairo',
    fontSize: 16
  );

  static TextStyle listTileContent = TextStyle
  (
    color: AppColors.yellowColor.withOpacity(.8),
    fontFamily: 'Cairo',
    fontSize: 14
  );

  static TextStyle listTileTrailing = TextStyle
  (
    color: AppColors.greyColor.withOpacity(.6),
    fontFamily: 'Cairo',
    fontSize: 12
  );

  static const TextStyle userInfoContent = TextStyle
  (
    color: AppColors.midNavyColor,
    fontFamily: 'Cairo',
    fontSize: 18
  );

  static const TextStyle userInfoTitle = TextStyle
  (
    color: AppColors.yellowColor,
    fontFamily: 'Cairo',
    fontSize: 12
  );

  static const TextStyle questionText = TextStyle
  (
    color: AppColors.darkNavyColor,
    fontFamily: 'Cairo',
    fontSize: 24
  );

  static const TextStyle trueResultTitle = TextStyle
  (
    color: AppColors.lightNavyColor,
    fontFamily: 'Cairo',
    fontSize: 32
  );

  static TextStyle falseResultTitle = TextStyle
  (
    color: AppColors.errorColor,
    fontFamily: 'Cairo',
    fontSize: 32
  );
  
  static const  TextStyle stopWatchText= TextStyle
  (
    color: AppColors.greyColor,
    fontFamily: 'Cairo',
    fontSize: 16
  );
}