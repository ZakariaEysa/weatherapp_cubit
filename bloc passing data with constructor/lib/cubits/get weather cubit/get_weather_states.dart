import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/models/weathermodel.dart';

class WeatherState {}

class WeatherinitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {

 final  weathermodel weatherdata;
 WeatherLoadedState(this.weatherdata);



}

class WeatherFalierState extends WeatherState {}
