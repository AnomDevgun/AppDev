import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climate_plus/utilities/constants.dart';
import 'package:climate_plus/services/weather.dart';

class LocationScreenDifferentCity extends StatefulWidget {
  LocationScreenDifferentCity({this.locationWeather, this.currentTime});
  final locationWeather;
  final currentTime;
  @override
  _LocationScreenDifferentCityState createState() =>
      _LocationScreenDifferentCityState();
}

class _LocationScreenDifferentCityState
    extends State<LocationScreenDifferentCity> {
  WeatherModel weather = new WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  String locationTemp;
  String currentIn = 'in';
  var flareTimeOfDay;
  String rainType;
  String rainDay = 'assets/Heavyrainyday.flr';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(
        widget.locationWeather,
        widget
            .currentTime); //widget will tap into the statefulWidget so it can access data passed from loading screen
  }

  void updateUI(dynamic weatherData, dynamic curTime) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        cityName = '';
        locationTemp = 'Unable to get weather data';
        currentIn = '';
        return;
      }

      var condition = weatherData['weather'][0]['id'];
      if (curTime > 5 && curTime < 19) {
        flareTimeOfDay = weather.getIfRainy(condition, 'day');
        rainDay = weather.getWeather(condition, 'day');
      } else {
        flareTimeOfDay = weather.getIfRainy(condition, 'night');
        rainDay = weather.getWeather(condition, 'night');
      }

      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      locationTemp = weather.getMessage(temperature);

      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      currentIn = 'in';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: FlareActor(
              'assets/daynight.flr',
              animation: '$flareTimeOfDay',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          '$temperature°',
                          style: kTempTextStyle,
                        ),
                        Flexible(
                          child: Text(
                            weatherIcon,
                            style: kConditionTextStyle,
                          ),
                        ),
                        Container(
                          //FlareActor for rive animation of rain
                          width: 80,
                          height: 80,
                          child: FlareActor(
                            '$rainDay',
                            animation: '$rainType',
                            fit: BoxFit.fill,
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ],
                    ),
                  ),
//                    Padding(
//                      padding: EdgeInsets.only(right: 15.0),
//                      child: Text(
//                        '$locationTemp $currentIn  $cityName',
//                        textAlign: TextAlign.right,
//                        style: kMessageTextStyle,
//                      ),
//                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
