import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wheather_app/Models/models.dart';

getweather(String city) async {
//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
  final querryParameter = {
    "q": city,
    "appid": "5eb451417d2753ced7fcb455482493d9"
  };
  final uri =
      Uri.https("api.openweathermap.org", "data/2.5/weather", querryParameter);
  var response = await http.get(uri);
  var json = jsonDecode(response.body);
  double cel = (json["main"]["temp"]) - 273.15;
  double far = (cel * 9 / 5) + 32;
  dynamic currentTime = DateFormat.jm().format(DateTime.now());

  WeatherModel weatherDetail = WeatherModel(
      celsius: "${cel} C",
      farenheit: "${far} F",
      city: city,
      main: json["weather"]["0"]["main"],
      country: json["sys"]["country"],
      wind: json["wind"]["speed"],
      date: currentTime,
      humidity: json["main"]["humidity"]);

  return json;
}
