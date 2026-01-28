import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:milkman/utils/asset%20manager/assets.dart';
import 'package:milkman/utils/routes/route_names.dart';
import 'package:milkman/utils/theme/colors.dart';
import 'package:milkman/utils/theme/responsive_text.dart';
import 'package:milkman/utils/theme/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final isOnboarded = prefs.getBool('isOnboarded') ?? false;

    // Add a small delay to show splash animation
    await Future.delayed(const Duration(seconds: 4));

    if (isOnboarded) {
      // User already onboarded → go to Home
      Navigator.pushReplacementNamed(context, RouteNames.homePageView);
    } else {
      // User not onboarded → go to Onboarding
      Navigator.pushReplacementNamed(context, RouteNames.onboardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.primaryLight],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 300),
            SizedBox(height: 200, child: Lottie.asset(Asset.cow)),
            const SizedBox(height: 50),
            Text('OrganicMandi', style: AppTextStyles.heading),
            const SizedBox(height: 20),
            Text('Freshness Delivered Daily', style: AppTextStyles.subtitle),
            const SizedBox(height: 200),
            LoadingAnimationWidget.waveDots(color: Colors.white, size: 30),
            Text(
              'V1.0.0',
              style: ResponsiveText.body(context).copyWith(letterSpacing: 2.0),
            ),
          ],
        ),
      ),
    );
  }
}
