import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';


import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InputPage(),
    );
  }
}


// accentColor ==forGroundColor
