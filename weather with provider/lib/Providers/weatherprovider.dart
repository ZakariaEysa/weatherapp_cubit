 import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weathermodel.dart';

class WeatherProvider extends ChangeNotifier{

  weathermodel? _weatherdata;

  set weatherdata(  weathermodel? weather){

    _weatherdata=weather;
    notifyListeners();



  }
  weathermodel? get weatherdata => _weatherdata;




}