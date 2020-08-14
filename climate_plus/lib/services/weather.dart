import 'package:climate_plus/services/networking.dart';
import 'package:climate_plus/services/location.dart';
import 'package:climate_plus/utilities/keys.dart';

const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
const timeZoneUrl =
    'http://api.timezonedb.com/v2.1/get-time-zone?key=YOUR_API_KEY&format=xml&by=position&lat=40.689247&lng=-74.044502';

class WeatherModel {
  Future<dynamic> cityWeather(String cityName) async {
    var url =
        '$openWeatherMapUrl?q=$cityName&appid=$OpenWeatherApiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> cityName(var lat, var long) async {
    var url =
        'http://api.timezonedb.com/v2.1/get-time-zone?key=$GeolocationApiKey&format=json&by=position&lat=$lat&lng=$long';
    NetworkHelper networkHelper = NetworkHelper(url);
    var cityWeather = await networkHelper.getData();
    return cityWeather;
  }

  Future<dynamic> getLocationWeather() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=$OpenWeatherApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'Thunderstorm';
    } else if (condition < 400) {
      return 'Drizzle';
    } else if (condition < 600) {
      return 'Rain';
    } else if (condition < 700) {
      return 'Snow';
    } else if (condition < 800) {
      return 'Mist/Haze/Smoke';
    } else if (condition == 800) {
      return 'Clear';
    } else {
      return 'Cloudy';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  String getWeather(int condition, String time) {
    if (time == 'day') {
      if (condition < 600) {
        return 'assets/Heavyrainyday.flr';
      } else if (condition < 700) {
        return 'assets/snowflakes.flr';
      } else if (condition == 800) {
        return 'assets/day.flr';
      } else {
        return 'assets/cloudy-day.flr';
      }
    } else {
      if (condition < 600) {
        return 'assets/HeavyrainyNight.flr';
      } else if (condition < 700) {
        return 'assets/snowflakes.flr';
      } else if (condition == 800) {
        return 'assets/night.flr';
      } else {
        return 'assets/cloudy-night.flr';
      }
    }
  }

  String getIfRainy(int condition, String time) {
    if (condition < 600) {
      if (time == 'day') {
        return 'day_idle_rainy';
      } else {
        return 'night_idle_rainy';
      }
    } else {
      if (time == 'day') {
        return 'day_idle';
      } else {
        return 'night_idle';
      }
    }
  }
}
