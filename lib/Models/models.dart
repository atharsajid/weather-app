import 'package:flutter/material.dart';

class WeatherModel {
  String celsius;

  String city;
  dynamic main;
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
  });
}
