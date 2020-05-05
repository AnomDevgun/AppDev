import 'package:flutter/material.dart';

//use , after widget end parenthesis to allow flutter auto indent
//The main function is the starting point for all apps
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Text(
                  'This is Your Drawer',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.camera_enhance),
                title: Text('Camera'),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Welcome to uHome'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.indigoAccent]),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [Colors.purple, Colors.blueAccent]),
          ),
          child: Center(
            child: Text(
              'uHome',
              style: TextStyle(fontSize: 30, color: Colors.white70),
            ),
          ),
        ),
      ),
    ),
  );
}
