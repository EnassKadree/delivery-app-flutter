import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/styles_constants.dart';

class AppTheme {
  //variables
  static late Color primaryColor;
  static late Color secondaryColor;
  static late Color scaffoldBackgroundColor;
  static late Color surfaceContainer;
  static late Color secondaryContainer;
  static late Color primaryContainer;

  static ThemeData get lightTheme 
  {
    // colors
    primaryColor = AppColors.midNavyColor;
    secondaryColor = AppColors.yellowColor;
    scaffoldBackgroundColor = const Color(0xffffffff);
    surfaceContainer = Colors.white;
    primaryContainer = const Color(0xffD5D5D5);
    secondaryContainer = const Color(0xff888888);

    // theme light
    return ThemeData
    (
      fontFamily: "Cairo",
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      iconTheme: const IconThemeData(color: Colors.black),
      // color system
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        surfaceContainer: surfaceContainer,
        brightness: Brightness.light,
        secondaryContainer: secondaryContainer,
        primaryContainer: primaryContainer,
      ),
      // appbar
      appBarTheme: AppBarTheme(
        shadowColor: Colors.black,
        backgroundColor: scaffoldBackgroundColor,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: secondaryColor, size: 28),
        // titleTextStyle: const TextStyle(
        //   color: Colors.black,
        //   fontSize: 20,
        //   fontFamily: "Cairo",
        // ),
      ),
      //input decoration
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: primaryColor),
        hintStyle: TextStyle(color: secondaryContainer, fontSize: 15),
        floatingLabelStyle: TextStyle(color: secondaryColor, fontSize: 15),
        suffixIconColor: secondaryContainer,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryContainer, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[800]!, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[800]!, width: 1),
          borderRadius: BorderRadius.circular(8),
        ) ,
      ),

      //elevation ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle
          (
            fontSize: 18, fontWeight: FontWeight.bold,
            fontFamily: 'Cairo'
          ),
          minimumSize: const Size(100, 50),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      dialogTheme: const DialogTheme
      (
        titleTextStyle: StylesConsts.dialogTitle,
        contentTextStyle: StylesConsts.dialogContent,
      ),

      textButtonTheme: TextButtonThemeData
      (
        style: TextButton.styleFrom
        (
          backgroundColor: primaryColor.withOpacity(.2),
          foregroundColor: primaryColor,
          shape: RoundedRectangleBorder
          (
            borderRadius: BorderRadius.circular(12)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24)
        )
      ),

      tabBarTheme: TabBarTheme
      (
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: primaryColor,
        labelColor: secondaryColor,
        indicatorColor: secondaryColor,
        dividerColor: Colors.grey[200],
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData
      (
        selectedItemColor: secondaryColor,
        selectedIconTheme: const IconThemeData(size: 28)
      ),
    );
  }
}