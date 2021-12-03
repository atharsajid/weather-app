import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wheather_app/Models/models.dart';

getweather(String city) async {
//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
  final querryParameter = {
    "q": city,
    "appid": "5eb451417d2753ced7fcb455482493d9",
    "units": "metric",
  };
  // final uri =
  //     Uri.https("api.openweathermap.org", "data/2.5/weather", querryParameter);

  var response = await http.get(
      Uri.https("api.openweathermap.org", "data/2.5/weather", querryParameter));
  var json = jsonDecode(response.body);

  WeatherModel weatherDetail = WeatherModel(
      celsius: "${json["main"]["temp"]}°C",
      city: city,
      main: (json["weather"][0]["description"]),
      country: json["sys"]["country"],
      wind: json["wind"]["speed"],
      humidity: json["main"]["humidity"]);

  return weatherDetail;
}
