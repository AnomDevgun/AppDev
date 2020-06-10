import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/dow.png'),
              ),
              Text(
                'Anom Devgun',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30.0,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Student',
                style: TextStyle(
                  fontFamily: 'SansPro',
                  fontSize: 25.0,
                  color: Colors.black54,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.deepPurple[900],
                  thickness: 1.0,
                ),
              ),
              Card(
                color: Colors.white70,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 30.0,
                  ),
                  title: Text(
                    '+91 1234567890',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'SansPro',
                        color: Colors.deepPurple[500]),
                  ),
                ),
              ),
              Card(
                color: Colors.white70,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 30.0,
                  ),
                  title: Text(
                    'flutterdev@gmail.com',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'SansPro',
                        color: Colors.deepPurple[500]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
