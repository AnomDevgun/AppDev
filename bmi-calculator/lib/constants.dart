import 'package:flutter/material.dart';

const kBottomContainerHeight = 60.0;
const kInactiveCardColor = Color(0xFF53B4DF);
const kBottomContainerColor = Color(0xFFad1457);
const kActiveCardColor = Color(0xFF1C9CD6);
const kMinHeightMetric = 120.0;
const kMaxHeightMetric = 230.0;
const kMinHeightImperial = 47.0;
const kMaxHeightImperial = 90.0;
const kMinWeightMetric = 60.0;
const kMaxWeightMetric = 180.0;
const kMinWeightImperial = 132.0;
const kMaxWeightImperial = 396.0;
double kMinHeight = kMinHeightMetric;
double kMaxHeight = kMaxHeightMetric;
double kMinWeight = kMinWeightMetric;
double kMaxWeight = kMaxWeightMetric;

const kLabelTextStyle = TextStyle(
  fontSize: 14.0,
  color: Color(0xFF616161),
);

const kNumberTextStyle = TextStyle(
  fontSize: 35.0,
  fontWeight: FontWeight.w900,
);

const kUnitTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 17,
);

const kLargeButtonStyle = TextStyle(
  fontSize: 21,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 42.0,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF7b1fa2),
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 20,
);

const kLandingPageStyle = TextStyle(
  shadows: <Shadow>[
    Shadow(
      offset: Offset(5.0, 7.0),
      blurRadius: 2.0,
      color: Color.fromARGB(70, 200, 20, 20),
    ),
  ],
  fontSize: 37.0,
  color: Colors.white,
  fontWeight: FontWeight.w300,
  fontStyle: FontStyle.italic,
);

const kAppBarStyle = TextStyle(fontWeight: FontWeight.w300);
