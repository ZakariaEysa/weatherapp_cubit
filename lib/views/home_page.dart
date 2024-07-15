import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/WeatherCubit/get_weather_cubit.dart';
import '../cubits/WeatherCubit/get_weather_states.dart';

import 'no_weather_body.dart';
import 'search_page.dart';
import 'weather_body_info.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  static bool s = false;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        Widget buildShowScreen() {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherBodyInfo();
          } else {
            return const Center(
                child: Text(
              style: TextStyle(fontSize: 30),
              "",
            ));
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Weather App"),
            backgroundColor: getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context).weatherModel?.status),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const SearchPage();
                      },
                    ));
                  },
                  icon: const Icon(Icons.search, size: 27),
                ),
              ),
            ],
          ),
          body: buildShowScreen(),
        );
      },
    );
  }
}
