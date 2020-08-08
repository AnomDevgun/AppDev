import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/bodyfatresults_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_columnincard.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/bfat_brain.dart';
import 'package:bmi_calculator/fade_route.dart';

enum Gender {
  male,
  female,
}

enum Scale {
  imperial,
  metric,
}

class BodyFat extends StatefulWidget {
  @override
  _BodyFatState createState() => _BodyFatState();
}

class _BodyFatState extends State<BodyFat> {
  TextEditingController myWaist = new TextEditingController();
  TextEditingController myNeck = new TextEditingController();
  TextEditingController myHip = new TextEditingController();
  Gender genderPicked = Gender.male;
  Scale scalePicked = Scale.metric;
  String currentUnitHeight = 'cm';
  String currentUnitWeight = 'kg';
  int height = 180;
  int weight = 60;
  int age = 18;
  int currentUnit = 1;
  int currentWaist = 0, currentHip = 0, currentNeck = 0;
  double kMinHeight = 106.0;
  double kMaxHeight = 230.0;
  double kMinAge = 5.0;
  double kMaxAge = 100.0;
  double kMinWeight = 30.0;
  double kMaxWeight = 180.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Calculate your body fat',
          style: kAppBarStyle,
        ),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          genderPicked = Gender.male;
                        });
                      },
                      colour: genderPicked == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: ResuableColumn(
                        cardIcon: FontAwesomeIcons.mars,
                        cardName: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          genderPicked = Gender.female;
                        });
                      },
                      colour: genderPicked == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: ResuableColumn(
                        cardIcon: FontAwesomeIcons.venus,
                        cardName: 'FEMALE',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 47.0,
              color: kInactiveCardColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: scalePicked == Scale.metric
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      onPress: () {
                        setState(() {
                          scalePicked = Scale.metric;
                          currentUnitHeight = 'cm';
                          height = 180;
                          kMinHeight = 120.0;
                          kMaxHeight = 230.0;
                          kMinWeight = 30.0;
                          kMaxWeight = 180.0;
                          currentUnitWeight = 'kg';
                          weight = 60;
                          currentUnit = 1;
                          age = 18;
                        });
                      },
                      cardChild: Text(
                        '(kg,cm)',
                        style: kUnitTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          scalePicked = Scale.imperial;
                          currentUnitHeight = 'inches';
                          height = 70;
                          kMinHeight = 47.0;
                          kMaxHeight = 90.0;
                          kMinWeight = 132.0;
                          kMaxWeight = 396.0;
                          currentUnitWeight = 'lbs';
                          weight = 264;
                          currentUnit = 2;
                          age = 18;
                        });
                      },
                      colour: scalePicked == Scale.imperial
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: Text(
                        '(lbs,inches)',
                        style: kUnitTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'HEIGHT',
                              style: kLabelTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  height.toString(),
                                  style: kNumberTextStyle,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  currentUnitHeight,
                                  style: kLabelTextStyle,
                                ),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 13.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 25),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              activeColor: Color(0xFFc2185b),
                              inactiveColor: Color(0xFF8D8E98),
                              min: kMinHeight,
                              max: kMaxHeight,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  weight.toString(),
                                  style: kNumberTextStyle,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  currentUnitWeight,
                                  style: kLabelTextStyle,
                                ),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 13.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 25),
                            ),
                            child: Slider(
                              value: weight.toDouble(),
                              activeColor: Color(0xFFc2185b),
                              inactiveColor: Color(0xFF8D8E98),
                              min: kMinWeight,
                              max: kMaxWeight,
                              onChanged: (double newValue) {
                                setState(() {
                                  weight = newValue.toInt();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ReusableCard(
                              colour: kInactiveCardColor,
                              cardChild: TextField(
                                textAlign: TextAlign.center,
                                controller: myNeck,
                                decoration: new InputDecoration(
                                    hintText: "Neck($currentUnitHeight)"),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ], // Only numbers can be entered
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ReusableCard(
                              colour: kInactiveCardColor,
                              cardChild: TextField(
                                textAlign: TextAlign.center,
                                controller: myWaist,
                                decoration: new InputDecoration(
                                    hintText: "Waist($currentUnitHeight)"),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ], // Only numbers can be entered
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ReusableCard(
                              colour: kInactiveCardColor,
                              cardChild: TextField(
                                textAlign: TextAlign.center,
                                controller: myHip,
                                decoration: new InputDecoration(
                                    hintText: "Hip($currentUnitHeight)"),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ], // Only numbers can be entered
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  age.toString(),
                                  style: kNumberTextStyle,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  'Y',
                                  style: kLabelTextStyle,
                                ),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 13.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 20),
                            ),
                            child: Flexible(
                              child: Slider(
                                value: age.toDouble(),
                                activeColor: Color(0xFFc2185b),
                                inactiveColor: Color(0xFF8D8E98),
                                min: 5,
                                max: 100,
                                onChanged: (double newValue) {
                                  setState(() {
                                    age = newValue.toInt();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'Calculate',
              onTap: () {
                currentHip = int.parse(myHip.text);
                currentNeck = int.parse(myNeck.text);
                currentWaist = int.parse(myWaist.text);
                if (currentUnit == 1) {
                  BFatBrain calc = BFatBrain(
                      height: height,
                      weight: weight,
                      hip: currentHip,
                      waist: currentWaist,
                      neck: currentNeck,
                      unit: currentUnit);
                  Navigator.push(
                      context,
                      FadeRoute(
                          page: BodyFatRes(
                        bodyFat: calc.Calculate(),
                      )));
                } else {
                  BFatBrain calc = BFatBrain(
                      height: height,
                      weight: weight,
                      hip: currentHip,
                      waist: currentWaist,
                      neck: currentNeck,
                      unit: currentUnit);
                  Navigator.push(
                      context,
                      FadeRoute(
                          page: BodyFatRes(
                        bodyFat: calc.Calculate(),
                      )));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

//FlatButton(
//color: kActiveCardColor,
//onPressed: () {
//currentHip = int.parse(myHip.text);
//print(currentHip);
//},
//child: Text('Enter'),
//),
