import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: AppColors.primary,
      //primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      textTheme: TextTheme(),
      appBarTheme: AppBarTheme(backgroundColor: AppColors.primary),
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
      textTheme: TextTheme(),
      appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryLight),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.secondary,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
