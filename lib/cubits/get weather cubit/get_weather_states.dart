import 'package:weatherapp/models/weathermodel.dart';

class WeatherState {}

class WeatherinitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(weathermodel weathermodel);

}

class WeatherFalierState extends WeatherState {
  final String errormess;

  WeatherFalierState(this.errormess);
}
