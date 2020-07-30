import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF757575),
);

class ResuableColumn extends StatelessWidget {
  final IconData cardIcon;
  final String cardName;

  ResuableColumn({
    this.cardIcon,
    this.cardName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardName,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
