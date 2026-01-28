import 'package:flutter/material.dart';

class AppColors {
  // late BuildContext context;
  //  AppColors({required context});

  static const Color primary = Color.fromRGBO(4, 2, 183, 100);
  static const Color primaryLight = Color.fromRGBO(1, 98, 197, 97);
  static const Color secondary = Color(0xFF2B9DEE);

  static const Color backgroundLight = Colors.white;
  static const Color backgroundDark = Colors.black;
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF212121);

  //  Color get secondaryBackroundLight => Theme.of(context).colorScheme.surface;
  Color get secondaryBackgroundDark => const Color(0xFF1B2530);
}
