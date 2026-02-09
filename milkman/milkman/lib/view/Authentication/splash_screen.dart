import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:milkman/services/splash_service.dart';
import 'package:milkman/utils/asset%20manager/assets.dart';
import 'package:milkman/utils/asset%20manager/strings.dart';
import 'package:milkman/utils/theme/colors.dart';
import 'package:milkman/utils/theme/responsive_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    final routeName = await SplashService.checkFirstTime();

    if (!mounted) return;

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primaryLight],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.2, 0.8],
              ),
            ),
          ),
          // Noise overlay
          Opacity(
            opacity: 0.03,
            child: Image.asset(
              "assets/images/noise.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.3),
              SizedBox(
                height: size.height * 0.2,
                child: Lottie.asset(Asset.cow),
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                Strings.appName,
                style: ResponsiveText.heading(
                  context,
                ).copyWith(color: Colors.white),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                Strings.bio,
                style: ResponsiveText.subtitle(
                  context,
                ).copyWith(color: Colors.white70),
              ),
              SizedBox(height: size.height * 0.21),
              LoadingAnimationWidget.waveDots(color: Colors.white, size: 30),
              Text(
                Strings.appVersion,
                style: ResponsiveText.body(
                  context,
                ).copyWith(letterSpacing: 2.0, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
