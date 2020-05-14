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
            child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.indigo,
              height: 100.0,
              width: 300.0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  //containers can only have 1 child
                  'The Witcher 3',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: Text(
                'Container 2',
                textAlign: TextAlign.center,
              ),
              color: Colors.blueAccent,
              width: 300,
              height: 100,
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: Text(
                'Container 3',
                textAlign: TextAlign.center,
              ),
              color: Colors.greenAccent,
              width: 300,
              height: 100,
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.settings),
          backgroundColor: Colors.pinkAccent[400],
        ),
      ),
    );
  }
}
