import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uchat/screens/chat_screen.dart';
import 'package:uchat/screens/login_screen.dart';
import 'package:uchat/screens/registration_screen.dart';
import 'package:uchat/screens/welcome_screen.dart';
import 'loading.dart';

User user;

class Choice extends StatefulWidget {
  static const id = 'choice';
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  final _auth = FirebaseAuth.instance;

  void checkStat() async {
    final currUser = _auth.currentUser;
    if (currUser != null) {
      user = currUser;
    }
  }

  MaterialApp checkUser() {
    if (user != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black54),
          ),
        ),
        initialRoute: ChatScreen.id,
        routes: {
          ChatScreen.id: (context) => ChatScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          LoadingScreen.id: (context) => LoadingScreen(),
        },
      );
//      Navigator.pushReplacementNamed(context, ChatScreen.id);
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black54),
          ),
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          LoadingScreen.id: (context) => LoadingScreen(),
        },
      );
    }
//    Navigator.pushReplacementNamed(context, WelcomeScreen.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkStat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlareActor(
          'assets/loading.flr',
          animation: 'Alarm',
          alignment: Alignment.center,
        ),
        checkUser(),
      ],
    );
  }
}
