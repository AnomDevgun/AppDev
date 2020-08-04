//Can wrap individual widgets with theme widget and a child of data
//const cant have access beyond runtime

import 'package:flutter/material.dart';
import 'screens/bmiinput_page.dart';
import 'screens/landing_page.dart';
import 'screens/bodyfat_page.dart';
import 'package:bmi_calculator/screens/bodyfatresults_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Body Fat/BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF2FA4D9),
        accentColor: Color(0xFF404040),
        scaffoldBackgroundColor: Color(0xFF3949ab),
      ),
      initialRoute: '/landingpage',
      routes: {
        '/landingpage': (context) => LandingPage(),
        '/bmi': (context) => InputPage(),
        '/bodyfat': (context) => BodyFat(),
        //'/bfatresult': (context) => BodyFatRes(),
      },
    );
  }
}
