import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/Screens/login.dart';
import 'package:flutter_food_delivery_app/models/onboading_class.dart';
import 'package:flutter_food_delivery_app/Screens/onborading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_food_delivery_app/Services/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  Future<void> nextPage() async {
    if (currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    else{
      await LocalStorage.setOnBoardingCompleted();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
  }
  Future<void> skip() async{
    await LocalStorage.setOnBoardingCompleted();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }
  final List<OnboadingClass> onboardingData = [
      OnboadingClass(
        image: "assets/onboarding1.png",
        title: "Discover Delicious Food",
        description:
            "Explore a wide variety of cuisines and dishes from local restaurants and Cafes.",
      ),
      OnboadingClass(
        image: "assets/onboarding2.png",
        title: "Fast and Reliable Delivery",
        description:
            "Get your food delivered to your doorstep quickly and reliably.",
      ),
      OnboadingClass(
        image: "assets/onboarding3.png",
        title: "Live Tracking",
        description: "Track your order in real time from kitchen to doorstep.",
      ),
    ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Color(0xFFFFF3E0),
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: h * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: skip,
                  child: Text(
                    "Skip",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Color(0xFFE65100),
                    ),
                  )
                ),
                TextButton(
                  onPressed: nextPage,
                  child: Text(
                    currentIndex == onboardingData.length - 1 ? "Get Started" : "Next",
                    style: GoogleFonts.poppins(
                      color: Color(0xFFE65100),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Onboarding(item: onboardingData[index]);
                },
                itemCount: onboardingData.length,
                onPageChanged: (value) => setState(() => currentIndex = value),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10.0,
              children: List.generate(onboardingData.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: currentIndex == index ? 18 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: currentIndex == index
                        ? Color(0xFFE65100)
                        : Color(0xFFE65100).withOpacity(0.5),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
