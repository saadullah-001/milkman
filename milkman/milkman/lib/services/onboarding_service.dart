import 'package:flutter/material.dart';
import 'package:milkman/utils/routes/route_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  Future<void> completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboarded', true);

    Navigator.pushReplacementNamed(context, RouteNames.homePageView);
  }
}
