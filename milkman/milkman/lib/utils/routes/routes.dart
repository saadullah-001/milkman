import 'package:flutter/material.dart';
import 'package:milkman/utils/routes/route_names.dart';
import 'package:milkman/view/Authentication/Signup_view.dart';
import 'package:milkman/view/Authentication/forgot_password_view.dart';
import 'package:milkman/view/Authentication/login_view.dart';
import 'package:milkman/view/Authentication/onboarding_screen.dart';
import 'package:milkman/view/Authentication/splash_screen.dart';
import 'package:milkman/view/home_page.dart';
import 'package:milkman/view/home_order_view.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onboardingScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const OnboardingScreen(),
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteNames.loginView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView(),
        );
      case RouteNames.homePageView:
        return MaterialPageRoute(builder: (context) => const HomePage());

      case RouteNames.signupView:
        return MaterialPageRoute(builder: (context) => const SignUpView());

      case RouteNames.forgotPasswordView:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordView(),
        );

      case RouteNames.homeOrderView:
        return MaterialPageRoute(builder: (context) => const HomeOrderView());

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('No route defined')),
            );
          },
        );
    }
  }
}
