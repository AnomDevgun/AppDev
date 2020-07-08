import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(child: Text('Hello')),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.deepPurpleAccent,
              Colors.blueAccent,
              Colors.greenAccent.shade200
            ])),
          ),
        ),
      ),
    );
  }
}
