import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherServes {
  final Dio dio;
  final String baseurl = "https://api.weatherapi.com/v1";
  final String apiKey = "8114aca258664dfb98c152059240302";
  WeatherServes({required this.dio});

  Future<WeatherModel> getCurrentWeather({required String country}) async {
    try {
      Response response =
          await dio.get("$baseurl/forecast.json?key=$apiKey&q=$country");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "oops there was an error try later ";

      throw (errorMessage);
      // TODO
    } catch (w) {
      log(w.toString());
      throw Exception("oops there was an error try later ");
    }
  }
}
