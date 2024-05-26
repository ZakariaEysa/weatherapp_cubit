import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get%20weather%20cubit/Get_Weather_cubit.dart';
import 'package:weatherapp/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weatherapp/views/nowheatherbody.dart';
import 'package:weatherapp/views/search_page.dart';
import 'package:weatherapp/views/wheatherbodyinfo.dart';

import '../main.dart';

class Home_Page extends StatelessWidget {
  static bool s = false;

  const Home_Page({super.key});
  //weathermodel? weatherdata;
  @override
  Widget build(BuildContext context) {
    // weatherdata=Provider.of<WeatherProvider>(context).weatherdata;
    BlocProvider.of<Get_Weather_Cubit>(context).aa;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),

          backgroundColor: getThemeColor(
              BlocProvider.of<Get_Weather_Cubit>(context)
                  .Weathermodel
                  ?.status),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return search_page();
                    },
                  ));
                },
                icon: const Icon(Icons.search, size: 27),
              ),
            ),
          ],
        ),
        // s==true? Weathe_Body_Info() :
        body: BlocBuilder<Get_Weather_Cubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherinitialState) {
              return const No_Weather_Body();
            } else if (state is WeatherLoadedState) {
              //  print(state.weatherdata.cityname);

              return Weathe_Body_Info();
            } else {
              return Center(
                child: Text(
                  style: TextStyle( fontSize:30),
                    BlocProvider.of<Get_Weather_Cubit>(context).aa.toString()),
              );
            }
          },
        ));
  }
}
//No_Weather_Body()

// with provider
// ( Provider.of<WeatherProvider>(context,listen: true).weatherdata!=null) ? Weathe_Body_Info(
//
// cityname: Provider.of<WeatherProvider>(context).weatherdata?.cityname,
// date: Provider.of<WeatherProvider>(context).weatherdata!.date,
// maxtemp:Provider.of<WeatherProvider>(context).weatherdata!.maxtemp,
// mintemp:Provider.of<WeatherProvider>(context).weatherdata!.mintemp,
// status: Provider.of<WeatherProvider>(context).weatherdata!.status,
// temp: Provider.of<WeatherProvider>(context).weatherdata!.temp,
// ) : No_Weather_Body()
