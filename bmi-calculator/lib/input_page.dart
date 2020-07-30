import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_column.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 60.0;
const buttonColors = Color(0xFF4db6ac);
const bottomContainerColor = Color(0xFF880e4f);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: buttonColors,
                    cardChild: ResuableColumn(
                      cardIcon: FontAwesomeIcons.mars,
                      cardName: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: buttonColors,
                    cardChild: ResuableColumn(
                      cardIcon: FontAwesomeIcons.venus,
                      cardName: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: buttonColors),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: buttonColors),
                ),
                Expanded(
                  child: ReusableCard(colour: buttonColors),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

// make color 26a69a on press
