import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour; //card color
  final Widget cardChild; //the actual card
  final Function onPress; //can pass a function as first order object

  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
