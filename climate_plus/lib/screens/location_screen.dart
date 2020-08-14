import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climate_plus/utilities/constants.dart';
import 'package:climate_plus/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather, this.currentTime});
  final locationWeather;
  final currentTime;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
      rainType = 'inactive';
      rainDay = 'inactive';
      if (curTime > 6 && curTime < 17) {
        flareTimeOfDay = 'day_idle';
        if (condition < 600) {
          flareTimeOfDay = 'day_idle_rainy';
          rainType = 'blank';
          rainDay = 'assets/Heavyrainyday.flr';
        }
      } else {
        flareTimeOfDay = 'night_idle';
        if (condition < 600) {
          flareTimeOfDay = 'night_idle_rainy';
          rainType = 'go';
          rainDay = 'assets/HeavyrainyNight.flr';
        }
      }

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      locationTemp = weather.getMessage(temperature);

      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      currentIn = 'in';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () async {
                            var timeNow = new DateTime.now();
                            var weatherData =
                                await weather.getLocationWeather();
                            updateUI(weatherData, timeNow.hour);
                          },
                          child: Icon(
                            Icons.near_me,
                            size: 40.0,
                          ),
                        ),
                        FlatButton(
                          onPressed: () async {
                            var typedName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CityScreen();
                                },
                              ),
                            );
                            if (typedName != null) {
                              var weatherData =
                                  await weather.cityWeather(typedName);
                              updateUI(weatherData, DateTime.now().hour);
                            }
                          },
                          child: Icon(
                            Icons.location_city,
                            size: 40.0,
                          ),
                        ),
                      ],
                    ),
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
                              color: Colors.blueGrey,
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
      ),
    );
  }
}
