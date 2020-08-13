import 'package:climate_plus/services/networking.dart';
import 'package:climate_plus/services/location.dart';
import 'package:climate_plus/utilities/keys.dart';

const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> cityWeather(String cityName) async {
    var url =
        '$openWeatherMapUrl?q=$cityName&appid=$OpenWeatherApiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
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
}
