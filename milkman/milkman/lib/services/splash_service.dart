import 'package:milkman/utils/routes/route_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashService {
  static Future<String> checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final isOnboarded = prefs.getBool('isOnboarded') ?? false;
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // Add a small delay to show splash animation
    await Future.delayed(const Duration(seconds: 4000));

    if (isOnboarded && isLoggedIn) {
      return RouteNames.homePageView;
    } else if (!isLoggedIn) {
      return RouteNames.loginView;
    } else {
      return RouteNames.onboardingScreen;
    }
  }
}
