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
        titleTextStyle: AppTextStyles.title,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primaryLight,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: AppColors.primaryLight,
      //primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      textTheme: TextTheme(
        displayLarge: AppTextStyles.title,
        titleLarge: AppTextStyles.heading,
        titleMedium: AppTextStyles.subtitle,
        bodyLarge: AppTextStyles.body,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryLight,
        titleTextStyle: AppTextStyles.title,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.secondary,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
