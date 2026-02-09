import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveText {
  // Breakpoints
  static const double smallPhoneMaxWidth = 360;
  static const double mediumPhoneMaxWidth = 414;
  static const double largePhoneMaxWidth = 600;
  static const double tabletMaxWidth = 1024;

  static double _getScale(
    BuildContext context,
    double small,
    double medium,
    double large,
    double tablet,
    double desktop,
  ) {
    final width = MediaQuery.of(context).size.width;

    if (width <= smallPhoneMaxWidth) return small;
    if (width <= mediumPhoneMaxWidth) return medium;
    if (width <= largePhoneMaxWidth) return large;
    if (width <= tabletMaxWidth) return tablet;
    return desktop;
  }

  static TextStyle title(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final double fontSize = _getScale(context, 22, 26, 32, 36, 40);
    try {
      return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        //height: 1.0,
        color: scheme.onSurface, // adapts light/dark
        shadows: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      );
    } catch (__) {
      return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
        shadows: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      );
    }
  }

  static TextStyle heading(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final double fontSize = _getScale(context, 24, 30, 40, 52, 60);
    try {
      return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        //height: 1.0,
        color: scheme.onSurface,
        shadows: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      );
    } catch (_) {
      return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: scheme.onSurface,
        shadows: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      );
    }
  }

  static TextStyle subtitle(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final double fontSize = _getScale(context, 14, 16, 18, 20, 22);
    try {
      return TextStyle(
        fontSize: fontSize,
        color: scheme.onSurfaceVariant,
        //letterSpacing: 1.2,
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      );
    } catch (_) {
      return TextStyle(fontSize: fontSize, color: scheme.onSurface);
    }
  }

  static TextStyle body(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final double fontSize = _getScale(context, 12, 14, 16, 18, 20);
    try {
      return TextStyle(
        fontSize: fontSize,
        color: scheme.onSurface,
        //letterSpacing: 2.0,
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      );
    } catch (_) {
      return TextStyle(fontSize: fontSize, color: scheme.onSurface);
    }
  }

  static TextStyle caption(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final double fontSize = _getScale(context, 10, 12, 12, 14, 16);
    try {
      return TextStyle(
        fontSize: fontSize,
        color: scheme.outline, // or onSurfaceVariant with opacity
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      );
    } catch (_) {
      return TextStyle(fontSize: fontSize, color: scheme.outline);
    }
  }
}
