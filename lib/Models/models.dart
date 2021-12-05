import 'package:flutter/material.dart';

class WeatherModel {
  String celsius;
  String main;
  String city;
  dynamic description;
  String country;
  num wind;
  num humidity;

  WeatherModel({
    required this.celsius,
    required this.city,
    required this.main,
    required this.country,
    required this.wind,
    required this.humidity,
    required this.description,
  });
}
