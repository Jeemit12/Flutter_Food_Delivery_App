import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/Widgets/onboarding_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_food_delivery_app/Services/shared_preferences.dart';
import 'package:flutter_food_delivery_app/Screens/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showText = false;
  bool showTagline = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
    checkOnBoarding();
  }
  Future<void> checkOnBoarding() async {
    bool comp = await LocalStorage.isOnBoardingCompleted();
    Future.delayed(Duration(seconds: 3),(){
      if(!mounted) return;
      if(comp){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingPage()));
      }
    });
  }
  void startAnimation() {
    Future.delayed(const Duration(milliseconds: 1000), () {

      setState(() {
        showText = true;
      });
    });
    

    Future.delayed(const Duration(milliseconds: 1300), () {
      setState(() {
        showTagline = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFF3E0), Color(0xFFFFA726), Color(0xFFE65100)],
          ),
        ),
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: h * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "V1.0",
                  style: TextStyle(
                    color: Color(0xFFE65100),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.2),
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 900),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Opacity(opacity: value, child: child),
                );
              },
              child: Image.asset("assets/logo2.png", width: w * 0.6),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 900),
              opacity: showText ? 1 : 0,
              child: Text(
                "Petu",
                style: GoogleFonts.fredoka(
                  fontSize: 60,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 900),
              opacity: showTagline ? 1 : 0,
              child: Text(
                "Delivering Happiness, One Bite at a Time",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
