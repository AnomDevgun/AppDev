import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[600],
        appBar: AppBar(
          centerTitle: true,
          title: Text('I Am Poe'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.greenAccent[400], Colors.white70]),
            ),
          ),
        ),
        body: Center(
          child: Container(
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Which Mass Effect is this?'),
            ),
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/im1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
