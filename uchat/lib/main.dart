import 'package:flutter/material.dart';
import 'package:uchat/screens/loading.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/error.dart';
import 'screens/loading.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorScreen();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark().copyWith(
                textTheme: TextTheme(
                  bodyText1: TextStyle(color: Colors.black54),
                ),
              ),
              initialRoute: WelcomeScreen.id,
              routes: {
                ChatScreen.id: (context) => ChatScreen(),
                LoginScreen.id: (context) => LoginScreen(),
                RegistrationScreen.id: (context) => RegistrationScreen(),
                WelcomeScreen.id: (context) => WelcomeScreen(),
                LoadingScreen.id: (context) => LoadingScreen(),
              },
            );
          }
          return LoadingScreen();
        });
  }
}
