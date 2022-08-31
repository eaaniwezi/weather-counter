// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:job_test_task/models/weather.dart';

class WeatherRepo {
  static const weatherUrl =
      'http://api.openweathermap.org/data/2.5/weather?lat=';
  static const apiKey = "xxxxxxxxxxxxxxxxxxx";

  Future<Weather> fetchWeatherData(Position cordinates) async {
    var weatherDetails;
    try {
      final weatherDetails = await http.get(Uri.parse(weatherUrl +
          cordinates.latitude.toString() +
          "&lon=" +
          cordinates.longitude.toString() +
          "&appid=" +
          apiKey +
          "&units=metric"));
      var jsonData = convert.jsonDecode(weatherDetails.body);
      return Weather.fromJson(jsonData['main']);
    } catch (e) {
      return weatherDetails;
    }

    // var response = await http.get(
    //   Uri.parse(
    //       "$baseUrl/data/2.5/onecall?lat=$lat&lon=$lon&exclude=alerts,minutely&appid=$apiKey&units=metric&lang=ru"),
    // );
    // final cityData = jsonDecode(response.body);
    // // return SearchedCityModel.fromJson(cityData);
  }
}
