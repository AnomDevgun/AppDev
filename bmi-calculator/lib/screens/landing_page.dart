import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

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
            colors: [Color(0xff1565c0), Color(0xff42a5f5)],
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
                        Navigator.pushNamed(context, '/bmi');
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
                        Navigator.pushNamed(context, '/bodyfat');
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
