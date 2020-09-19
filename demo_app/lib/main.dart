import 'package:demo_app/screens/landing_page.dart';
import 'package:demo_app/screens/logged_in.dart';
import 'package:demo_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/screens/registration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'landingpage',
      routes: {
        'landingpage': (context) => LandingPage(),
        'registration': (context) => Registration(),
        'login': (context) => Login(),
        'loggedin': (context) => LoggedIn(),
      },
    );
  }
}
