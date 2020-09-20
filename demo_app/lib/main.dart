import 'package:demo_app/screens/landing_page.dart';
import 'package:demo_app/screens/logged_in.dart';
import 'package:demo_app/screens/view_data.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/screens/registration.dart';

void main() async {
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
        'view': (context) => View(),
        'loggedin': (context) => LoggedIn(),
      },
    );
  }
}
