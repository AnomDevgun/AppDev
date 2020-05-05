import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _monsters;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
          title: Text('GeraltofRivea'),
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: Text(
              'The Witcher 3',
              style: TextStyle(color: Colors.indigoAccent, fontSize: 28),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.settings),
          backgroundColor: Colors.pinkAccent[400],
        ),
      ),
    );
  }
}
