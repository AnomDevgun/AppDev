import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/fade_route.dart';
import 'bmiinput_page.dart';
import 'bodyfat_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Body Fat & BMI Calculator',
          style: kAppBarStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.1, 0.4, 0.6, 0.9],
            colors: [
              Color(0xff1565c0),
              Color(0xff42a5f5),
              Color(0xFF2979ff),
              Color(0xFF3f51b5)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Card(
                margin: EdgeInsets.all(40),
                elevation: 20,
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, FadeRoute(page: InputPage()));
                      },
                      child: Text(
                        'Calculate Bmi:',
                        textAlign: TextAlign.center,
                        style: kLandingPageStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Color(0xdcc2185b),
              thickness: 2.1,
              indent: 20,
              endIndent: 20,
              height: 5,
            ),
            Expanded(
              child: Card(
                color: kActiveCardColor,
                elevation: 20,
                margin: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, FadeRoute(page: BodyFat()));
                      },
                      child: Text(
                        'Calculate Body Fat Percentage:',
                        textAlign: TextAlign.center,
                        style: kLandingPageStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
