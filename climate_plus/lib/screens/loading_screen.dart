import 'package:flutter/material.dart';
import 'package:climate_plus/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    //print('this line of code is triggered');
  }

  void getLocation() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();
    print(currentLocation.latitude);
    print(currentLocation.longitude);
  }

  void getData() async {
    http.Response weatherResponse = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    if (weatherResponse.statusCode == 200) {
      String data = weatherResponse.body;
      print(data);
    } else {
      print(weatherResponse.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
