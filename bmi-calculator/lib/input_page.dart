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
  Gender genderSelected;
  Scale scaleSelected = Scale.metric;
  int height = 180;

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
            height: 50.0,
            color: kInactiveCardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ReusableCard(
                  colour: scaleSelected == Scale.metric
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  onPress: () {
                    setState(() {
                      scaleSelected = Scale.metric;
                    });
                  },
                  cardChild: Text('METRIC(kg,cm)', style: kUnitTextStyle),
                ),
                ReusableCard(
                  onPress: () {
                    setState(() {
                      scaleSelected = Scale.imperial;
                    });
                  },
                  colour: scaleSelected == Scale.imperial
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: Text('IMPERIAL(lbs,ft)', style: kUnitTextStyle),
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
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
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
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: kInactiveCardColor),
                ),
                Expanded(
                  child: ReusableCard(colour: kInactiveCardColor),
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
