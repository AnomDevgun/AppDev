import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/components/constants.dart';
import 'package:demo_app/functions/database_helper.dart';
import 'package:demo_app/screens/logged_in.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<Map<String, dynamic>> dat;
  int itemCount = 0;
  final dbHelper = DatabaseHelper.instance;
  void _print() async {
    // print all data to console
    dat = await dbHelper.queryAllRows();
    print(dat);
    print(dat[1]['email']);
    print(dat.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlareActor(
            'assets/Background Loop.flr',
            animation: 'Background Loop',
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Welcome',
                    style: kTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  FlatButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      setState(() {
//                        _print();
//                        itemCount = dat.length;
                      });
//                      Navigator.pushNamed(context, 'loggedin');
                    },
                    child: Text('Print Table in db'),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  Container(
                      height: 400.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red[500],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: LoggedIn()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
