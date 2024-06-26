import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/serveses/weatherservice.dart';

class Get_Weather_Cubit extends Cubit<WeatherState> {
  Get_Weather_Cubit() : super(WeatherinitialState());
  weathermodel? Weathermodel;
  String aa = " ";

  getWeather({required String Cityname}) async {
    try {
      Weathermodel = await weatherserves(dio: Dio())
          .get_Current_Weather(country: Cityname);
      //print(Weathermodel.cityname);
      emit(WeatherLoadedState( Weathermodel!));
    } catch (e) {
      emit(WeatherFalierState(aa = e.toString()));
    }
  }
}
