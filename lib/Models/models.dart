import 'package:flutter/material.dart';

class WeatherModel {
  String celsius;
  String farenheit;
  String city;
  String main;
  String country;
  double wind;
  double humidity;
  DateTime date;
  WeatherModel({
    required this.celsius,
    required this.farenheit,
    required this.city,
    required this.main,
    required this.country,
    required this.wind,
    required this.date,
    required this.humidity,
  });
}
