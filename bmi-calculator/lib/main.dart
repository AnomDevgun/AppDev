//Can wrap individual widgets with theme widget and a child of data

import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF00796B),
        accentColor: Color(0xFF4CAF50),
        scaffoldBackgroundColor: Color(0xFF009688),
      ),
      home: InputPage(),
    );
  }
}
