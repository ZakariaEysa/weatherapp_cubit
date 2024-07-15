import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/WeatherCubit/get_weather_cubit.dart';
import 'cubits/WeatherCubit/get_weather_states.dart';
import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return const MaterialApp(

              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  } else {
    switch (condition.toLowerCase()) {
      case "sunny":
      case "clear":
      case "partly cloudy":
        return Colors.orange;
      case "cloudy":
      case "overcast":
      case "fog":
      case "freezing fog":
        return Colors.grey;
      case "mist":
        return Colors.lightBlue;
      case "patchy rain possible":
      case "light rain":
      case "patchy light rain":
        return Colors.lightGreen;
      case "moderate rain at times":
      case "moderate rain":
      case "patchy moderate snow":
      case "patchy heavy snow":
      case "heavy rain at times":
      case "heavy rain":
        return Colors.green;
      case "moderate snow":
        return Colors.blue;
      case "heavy snow":
      case "blizzard":
      case "blowing snow":
      case "patchy snow possible":
      case "light snow":
      case "patchy light snow":
        return Colors.lightBlue;
      case "patchy sleet possible":
      case "light sleet":
        return Colors.indigo;
      case "moderate or heavy sleet":
      case "light sleet showers":
      case "moderate or heavy sleet showers":
        return Colors.indigo;
      case "freezing drizzle":
      case "patchy freezing drizzle possible":
      case "heavy freezing drizzle":
        return Colors.blue;
      case "thundery outbreaks possible":
      case "patchy light rain with thunder":
        return Colors.amber;
      case "moderate or heavy rain with thunder":
        return Colors.red;
      case "patchy light snow with thunder":
        return Colors.deepPurple;
      case "moderate or heavy snow with thunder":
        return Colors.purple;
      default:
        return Colors.blue;
    }
  }
}
