import 'package:flutter/cupertino.dart';
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
        body: SafeArea(
          child: Container(
            height: 200.0,
            width: 500.0,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                //containers can only have 1 child
                'The Witcher 3',
                style: TextStyle(color: Colors.indigoAccent, fontSize: 25),
              ),
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
