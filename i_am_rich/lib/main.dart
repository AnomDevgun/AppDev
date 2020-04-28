import 'package:flutter/material.dart';

//use , after widget end parenthesis to allow flutter auto indent
//The main function is the starting point for all apps
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          title: Center(
            child: Text('Home Kush Stash Management'),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/kush.jpg'), fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    ),
  );
}
