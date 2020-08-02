//Can wrap individual widgets with theme widget and a child of data
//const cant have access beyond runtime

import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF2FA4D9),
        accentColor: Color(0xFF404040),
        scaffoldBackgroundColor: Color(0xFF2FA4D9),
      ),
      home: InputPage(),
    );
  }
}
