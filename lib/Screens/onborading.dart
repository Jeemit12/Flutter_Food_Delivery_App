import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/models/onboading_class.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key, required this.item});
  final OnboadingClass item;
  
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      spacing: 30.0,
      children: [
        SizedBox(height: h * 0.06),
        Image.asset(item.image, width: w * 0.9, height: h * 0.4),
        Text(
          item.title,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          item.description,
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}