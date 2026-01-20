import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:milkman/utils/routes/route_names.dart';
import 'package:milkman/utils/routes/routes.dart';
import 'package:milkman/utils/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MilkmanApp(savedThemeMode: savedThemeMode));
}

class MilkmanApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MilkmanApp({super.key, required this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      debugShowFloatingThemeButton: true,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Adaptive Theme Demo',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        initialRoute: RouteNames.homePageView,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
