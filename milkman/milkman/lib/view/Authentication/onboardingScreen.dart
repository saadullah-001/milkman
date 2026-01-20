import 'package:flutter/material.dart';
import 'package:milkman/utils/routes/route_names.dart';
import 'package:milkman/utils/theme/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> completeOnboarding(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isOnboarded', true);

  Navigator.pushReplacementNamed(context, RouteNames.homePageView);
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  Size get size => MediaQuery.of(context).size;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },

            children: [
              Onboarding(
                title: 'Pure & Fresh Milk',
                description:
                    'Experience the taste of pure, unadulterated milk delivered straight from local farms to your doorstep every morning.',
                asset: 'assets/images/milk.jpg',
                size: size,
              ),
              Onboarding(
                title: 'Buy & Sell Animals',
                description:
                    'Connect with local farmers to trade livestock and pets securely. Healthy animals, transparent prices.',
                asset: 'assets/images/animal.png',
                size: size,
              ),
              Onboarding(
                title: 'Care for Your Pets',
                description:
                    'From routine checkups to finding the perfect playdate, everything your pet needs is right here.',
                asset: 'assets/images/pet.png',
                size: size,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: size.height * 0.07),
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: () {
                      completeOnboarding(context);
                    },
                    child: Text("Skip", style: AppTextStyles.subtitle),
                  ),
                  SizedBox(width: size.width * 0.05),
                ],
              ),
              Spacer(),
              button(_currentPage, _pageController, context),
              dots(_currentPage, size),
              SizedBox(height: size.height * 0.06),
            ],
          ),
        ],
      ),
    );
  }
}

class Onboarding extends StatefulWidget {
  final String title;
  final String description;
  final String asset;
  final Size size;

  const Onboarding({
    super.key,
    required this.title,
    required this.description,
    required this.asset,
    required this.size,
  });

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // 2s animation
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // start off-screen bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Start animation when widget builds
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(1),
        image: DecorationImage(
          image: AssetImage(widget.asset),
          fit: BoxFit.cover,
          opacity: 0.8,
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Text(widget.title, style: AppTextStyles.title),
            ),
          ),
          SizedBox(height: widget.size.height * 0.02),
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.size.width * 0.06,
                ),
                child: Text(
                  widget.description,
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(height: widget.size.height * 0.25),
        ],
      ),
    );
  }
}
//Dots

Widget dots(int currentPage, Size size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.01,
          vertical: size.height * 0.01,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Dots Indicator
            Row(
              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  width: size.width * 0.025,
                  height: size.height * 0.025,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget button(
  int currentPage,
  PageController pageController,
  BuildContext context,
) {
  Size size = MediaQuery.of(context).size;
  return ElevatedButton(
    onPressed: () {
      if (currentPage < 2) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        // Navigate to Home after last page
        completeOnboarding(context);
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 24, 23, 23),
      fixedSize: Size(size.height * 0.3, size.width * 0.01),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // elevation: 3,
    ),
    child: currentPage < 2
        ? Text(
            "Next",
            style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.bold),
          )
        : Text(
            "Get Started",
            style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.bold),
          ),
  );
}
