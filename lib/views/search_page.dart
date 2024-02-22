import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get%20weather%20cubit/Get_Weather_cubit.dart';
import 'package:weatherapp/views/homepage.dart';

class search_page extends StatelessWidget {
  search_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search A City"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var Getweathercubit = BlocProvider.of<Get_Weather_Cubit>(context);
              Getweathercubit.getWeather(Cityname: value);
              Home_Page.s = true;

              Navigator.pop(context);
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
