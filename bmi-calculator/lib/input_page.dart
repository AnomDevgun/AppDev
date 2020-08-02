import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_columnincard.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}
enum Scale {
  imperial,
  metric,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected = Gender.male;
  Scale scaleSelected = Scale.metric;
  static int heightMetric = 180;
  static int heightImperial = 70;
  static int weightMetric = 60;
  static int weightImperial = 132;
  int height = heightMetric;
  int weight = weightMetric;
  int age = 18;
  String currentChoiceOfUnits = 'cm';
  String currentChoiceOfWeight = 'kg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.male;
                      });
                    },
                    colour: genderSelected == Gender.male
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
                        genderSelected = Gender.female;
                      });
                    },
                    colour: genderSelected == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ResuableColumn(
                      cardIcon: FontAwesomeIcons.venus,
                      cardName: 'FEMALE',
                    ),
                  ),
                ),
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
                    colour: scaleSelected == Scale.metric
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    onPress: () {
                      setState(() {
                        scaleSelected = Scale.metric;
                        currentChoiceOfUnits = 'cm';
                        height = heightMetric;
                        kMinHeight = kMinHeightMetric;
                        kMaxHeight = kMaxHeightMetric;
                        currentChoiceOfWeight = 'kg';
                        weight = weightMetric;
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
                        scaleSelected = Scale.imperial;
                        currentChoiceOfUnits = 'inches';
                        height = heightImperial;
                        kMinHeight = kMinHeightImperial;
                        kMaxHeight = kMaxHeightImperial;
                        currentChoiceOfWeight = 'lbs';
                        weight = weightImperial;
                      });
                    },
                    colour: scaleSelected == Scale.imperial
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
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        currentChoiceOfUnits,
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 13.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
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
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              currentChoiceOfWeight,
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
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
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 2),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

// make color 26a69a on press

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 5.0, //can have a disabledElevation also
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF00bcd4),
      child: Icon(icon),
    );
  }
}
