import 'package:flutter/material.dart';
import '../cubits/WeatherCubit/get_weather_cubit.dart';
import '../main.dart';
import '../models/weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBodyInfo extends StatelessWidget {
  String? image = "https:";

  WeatherBodyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    MaterialColor color = getThemeColor(weatherModel.status);
    if (weatherModel.image.contains("https:")) {
      image = weatherModel.image;
    } else {
      image = 'https:${weatherModel.image}';
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          color.shade300,
          color.shade400,
          color.shade500,
          color.shade600,
          color.shade700,
          color.shade800,
          color.shade900,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),

      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'updated at ${weatherModel.date.hour}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Image.network(image!, scale: .5),

                //  Image.network(image),
                Text(
                  '${weatherModel.temp.round()}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                Column(
                  children: [
                    Text(
                      'MaxTemp: ${weatherModel.maxTemp.round()}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'MinTemp: ${weatherModel.minTemp.round()}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.status,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DateTime stringToDateTime(value) {
  return DateTime.parse(value);
}
