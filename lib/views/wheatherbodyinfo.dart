import 'package:flutter/material.dart';
import 'package:weatherapp/cubits/get%20weather%20cubit/Get_Weather_cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Weathe_Body_Info extends StatelessWidget {
  String? image = "https:";

  @override
  Widget build(BuildContext context) {
    weathermodel Weathermodel =
        BlocProvider.of<Get_Weather_Cubit>(context).Weathermodel!;
    MaterialColor colorr = getThemeColor(Weathermodel.status);
    if (Weathermodel.image.contains("https:")) {
      image = Weathermodel.image;
    } else {
      image = 'https:${Weathermodel.image}';
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          colorr.shade300,
          colorr.shade400,
          colorr.shade500,
          colorr.shade600,
          colorr.shade700,
          colorr.shade800,
          colorr.shade900,
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
              Weathermodel.cityname.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'updated at ${Weathermodel.date.hour}',
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
                SizedBox(
                  height: 25,
                ),
                Image.network(image!, scale: .5),

                //  Image.network(image),
                Text(
                  '${Weathermodel.temp.round()}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                Column(
                  children: [
                    Text(
                      'Maxtemp: ${Weathermodel.maxtemp.round()}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Mintemp: ${Weathermodel.mintemp.round()}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              Weathermodel.status,
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

DateTime StringToDateTime(value) {
  return DateTime.parse(value);
}
