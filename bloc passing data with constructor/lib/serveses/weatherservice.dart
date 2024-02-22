import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weatherapp/models/weathermodel.dart';

class weatherserves {
  final Dio dio;
  final String baseurl = "https://api.weatherapi.com/v1";
  final String apiKey = "8114aca258664dfb98c152059240302";
  weatherserves({required this.dio});

  Future<weathermodel> get_Current_Weather({required String country}) async {

    try {



      // Uri url=Uri.parse("$baseurl/forecast.json?key=$apiKey&q=$country");
      // http.Response res=   await http.get(url);
      // print("*****************************************************************");
      //
      // print(jsonDecode(res.body));

      Response response =
          await dio.get("$baseurl/forecast.json?key=$apiKey&q=$country");

      weathermodel Weathermodelex = weathermodel.fromjson(response.data);
          //  Home_Page.s=true;
      return Weathermodelex;
    } on DioException catch (e) {
      final String errormessage = e.response?.data["error"]["message"] ??
          "oops there was an error try later ";

      throw (errormessage);
      // TODO
    }
    catch(w){

      log(w.toString());
      throw Exception("oops there was an error try later ");

    }
  }
}
