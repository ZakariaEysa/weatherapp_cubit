import 'package:flutter/material.dart';

class Weathe_Body_Info extends StatelessWidget {
  Weathe_Body_Info(
      {super.key,
      required this.cityname,
      required this.date,
      required this.status,
      required this.temp,
      required this.maxtemp,
      required this.mintemp});

  String? cityname;
  String date;
  String status;
  double temp;
  double maxtemp;
  double mintemp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //
      //   backgroundColor:  Colors.orange,
      //   elevation: 0,
      //   title: const Text("Weather App"),
      // ),
      body: Container(
        width: double.infinity,
        color: Colors.orangeAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$cityname",
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
              'updated at $date',
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
                Image.asset('assets/images/clear.png'),

                //  Image.network(image),
                Text(
                  '$temp',
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
                      'Maxtemp: $maxtemp',
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
                      'Mintemp: $mintemp',
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
              status,
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
