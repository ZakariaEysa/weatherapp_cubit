import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Providers/weatherprovider.dart';
import 'package:weatherapp/cubits/get%20weather%20cubit/Get_Weather_cubit.dart';
import 'package:weatherapp/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weatherapp/views/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     // create: (context)=>Get_Weather_Cubit(weatherProvider: Provider.of<WeatherProvider>(context, listen: false)),

     create: (context)=>Get_Weather_Cubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home_Page(),
      ),
    );
  }
}
