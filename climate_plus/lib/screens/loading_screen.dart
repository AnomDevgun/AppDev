import 'package:flutter/material.dart';
import 'package:climate_plus/services/location.dart';
import 'package:climate_plus/utilities/keys.dart';
import 'package:climate_plus/services/networking.dart';

double latitude;
double longitude;
const apiKey = OpenWeatherApiKey;

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
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();
    latitude = (currentLocation.latitude);
    longitude = (currentLocation.longitude);
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}