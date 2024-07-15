import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/WeatherCubit/get_weather_cubit.dart';
import 'home_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              HomePage.s = true;

              Navigator.pop(context);
            },
            decoration: const InputDecoration(
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
