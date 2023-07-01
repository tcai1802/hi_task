import 'package:flutter/material.dart';
import 'package:hi_task/src/res/colors/app_colors.dart';
import 'package:hi_task/src/res/dimensions/app_dimensions.dart';
import 'package:hi_task/src/res/theme/base_theme.dart';

class AppTheme extends BaseTheme {
  @override
  ThemeData get lightTheme => ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors().brandColor_11,
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: AppDimensions().text3L,
            fontWeight: FontWeight.w400,
            color: AppColors().textColor_01,
          ),
          displayMedium: TextStyle(
            fontSize: AppDimensions().text2L,
            fontWeight: FontWeight.w400,
            color: AppColors().textColor_01,
          ),
          labelLarge: TextStyle(
            fontSize: AppDimensions().text2XS,
            fontWeight: FontWeight.w400,
            color: AppColors().textColor_01,
          ),
          labelMedium: TextStyle(
            fontSize: AppDimensions().textBase,
            fontWeight: FontWeight.w400,
            color: AppColors().textColor_01,
          ),
          labelSmall: TextStyle(
            fontSize: AppDimensions().textLg,
            fontWeight: FontWeight.w400,
            color: AppColors().textColor_01,
          ),
          bodyLarge: TextStyle(
            fontSize: AppDimensions().textSM,
            fontWeight: FontWeight.w400,
            color: AppColors().textColor_01,
          ),
          bodyMedium: TextStyle(
            fontSize: AppDimensions().textXL,
            fontWeight: FontWeight.w400,
            color: AppColors().textColor_01,
          ),
          bodySmall: TextStyle(
            fontSize: AppDimensions().textXS,
            fontWeight: FontWeight.w400,
            color: AppColors().textColor_01,
          ),
        ),
      );

  @override
  ThemeData get darkTheme => ThemeData.dark();
}
