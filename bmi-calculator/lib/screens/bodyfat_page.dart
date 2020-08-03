import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BodyFat extends StatefulWidget {
  @override
  _BodyFatState createState() => _BodyFatState();
}

class _BodyFatState extends State<BodyFat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bodyfat Calculator',
          style: kAppBarStyle,
        ),
      ),
    );
  }
}
