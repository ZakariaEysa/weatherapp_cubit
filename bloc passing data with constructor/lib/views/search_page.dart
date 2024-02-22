

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Providers/weatherprovider.dart';
import 'package:weatherapp/cubits/get%20weather%20cubit/Get_Weather_cubit.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/serveses/weatherservice.dart';
import 'package:dio/dio.dart';
import 'package:weatherapp/views/homepage.dart';
import 'package:weatherapp/views/wheatherbodyinfo.dart';
import 'package:weatherapp/Providers/weatherprovider.dart';


// Widget? wodel;

class search_page extends StatelessWidget {
  search_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.orangeAccent,
        title: const Text("Search A City"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
             //  weatherserves we= weatherserves(dio:Dio() );
             // weathermodel Weathermodel= await   we.get_Current_Weather(country: value!);
             // print("sdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");

          var Getweathercubit=   BlocProvider.of<Get_Weather_Cubit>(context);
                Getweathercubit.getWeather(Cityname: value);
              Home_Page.s=true;

              Navigator.pop(context);


          //    Provider.of<WeatherProvider>(context,listen: false).weatherdata =Weathermodel;
           //   Home_Page.s=true;

//              https://api.weatherapi.com/v1/forecast.json?key=7be042ed61094e4d899184108232210&q=cairo

              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) {
              //     return Weathe_Body_Info(
              //       cityname: Weathermodel.cityname,
              //       date: Weathermodel.date,
              //       maxtemp: Weathermodel.maxtemp,
              //       mintemp: Weathermodel.mintemp,
              //       status: Weathermodel.status,
              //       temp: Weathermodel.temp,
              //     );
              //   },
              // ));


            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                //   enabledBorder: OutlineInputBorder(),
                //       focusedBorder: OutlineInputBorder(),

                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
                hintText: ("Enter city Name"),
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
