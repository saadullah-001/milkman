import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: AppColors.primary,
      //primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      textTheme: TextTheme(
        displayLarge: AppTextStyles.title,
        titleLarge: AppTextStyles.heading,
        titleMedium: AppTextStyles.subtitle,
        bodyLarge: AppTextStyles.body,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        titleTextStyle: AppTextStyles.title.copyWith(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primary,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: AppColors.primaryLight,
      //primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        displayLarge: AppTextStyles.title.copyWith(color: Colors.white),
        bodyLarge: AppTextStyles.body.copyWith(color: Colors.white70),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryLight,
        titleTextStyle: AppTextStyles.title.copyWith(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primaryLight,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
