import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dice'),
          backgroundColor: Colors.blue,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftbutt = Random().nextInt(6) + 1; //gen random init numbers
  int rightbutt = Random().nextInt(6) + 1;

  void ss() {
    setState(() {
      leftbutt = Random().nextInt(6) + 1;
      rightbutt = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                ss();
              },
              child: Image.asset('images/dice$leftbutt.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                ss();
              },
              child: Image.asset('images/dice$rightbutt.png'),
            ),
          ),
        ],
      ),
    );
  }
}
