import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/serveses/weatherservice.dart';

class Get_Weather_Cubit extends Cubit<WeatherState> {
  Get_Weather_Cubit(super.initialState);

  getWeather({required String Cityname}) async {
    try {
      weathermodel Weathermodel =
          await weatherserves(dio: Dio()).get_Current_Weather(country: Cityname);
    }  catch (e) {
      emit(WeatherFalierState());
    }

    emit(WeatherLoadedState());
  }
}
