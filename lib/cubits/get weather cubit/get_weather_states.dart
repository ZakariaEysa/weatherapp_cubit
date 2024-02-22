class WeatherState {}

class WeatherinitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {

}

class WeatherFalierState extends WeatherState {
  final String errormess;

  WeatherFalierState(this.errormess);
}
