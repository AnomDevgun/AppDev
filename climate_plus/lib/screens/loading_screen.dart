import 'package:climate_plus/screens/location_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:climate_plus/services/weather.dart';

double latitude;
double longitude;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
    //print('this line of code is triggered');
  }

  void getLocationData() async {
    var now = new DateTime.now();
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
        currentTime: now.hour,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlareActor(
        'assets/Loading_White_Moon.flr',
        fit: BoxFit.scaleDown,
        animation: 'Alarm',
      ),
    );
  }
}
