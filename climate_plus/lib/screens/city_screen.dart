import 'dart:collection';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:climate_plus/utilities/constants.dart';
import 'package:climate_plus/services/weather.dart';
import 'location_screen_differentCity.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:convert';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
            child: FlareActor(
              'assets/Loading_White_Moon.flr',
              fit: BoxFit.scaleDown,
              animation: 'Alarm',
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 50.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: kTextFieldInputDecoration,
                      onChanged: (value) {
                        cityName = value;
                      },
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      WeatherModel weather = WeatherModel();
                      if (cityName != null) {
                        var addresses = await Geocoder.local
                            .findAddressesFromQuery(cityName);
                        var first = addresses.first;
                        var longTude = first.coordinates.longitude;
                        var latTude = first.coordinates.latitude;
                        var cityWea = await weather.cityName(latTude, longTude);
                        var timeRN = cityWea['formatted'];
                        String timeToPass = timeRN[11] + timeRN[12];
                        int hourToPass = int.parse(timeToPass);
                        print(timeToPass);
                        var weatherData = await weather.cityWeather(cityName);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LocationScreenDifferentCity(
                            locationWeather: weatherData,
                            currentTime: hourToPass,
                          );
                        }));
                      }
                    },
                    child: Text(
                      'Get Weather',
                      style: kButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
