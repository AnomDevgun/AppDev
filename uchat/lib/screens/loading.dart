import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static String id = 'error';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            FlareActor(
              'assets/loading.flr',
              animation: 'Alarm',
              alignment: Alignment.center,
            ),
            Text(
              'Loading..',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
