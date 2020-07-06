import 'package:flutter/material.dart';

//use , after widget end parenthesis to allow flutter auto indent
//The main function is the starting point for all apps
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('TestBuild'),
          ),
          drawer: Drawer(),
          backgroundColor: Colors.blueAccent,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to UHome',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.deepPurpleAccent,
                    thickness: 1.0,
                  ),
                ),
                Card(
                  color: Colors.white70,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: FlatButton(
                    onPressed: () {
                      print('New user button pressed');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.person_add,
                        size: 30.0,
                      ),
                      title: Text(
                        'New User',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'SansPro',
                            color: Colors.deepPurple[500]),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white70,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: FlatButton(
                    onPressed: () {
                      print('Existing user button pressed');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 30.0,
                      ),
                      title: Text(
                        'Existing User',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'SansPro',
                            color: Colors.deepPurple[500]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
