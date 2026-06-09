import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_food_delivery_app/Screens/splash_screen.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
