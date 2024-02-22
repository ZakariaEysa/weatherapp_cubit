

class weathermodel {
  final String cityname;
  final String date;
  final String image;
  final String status;
  final double temp;
  final double maxtemp;
  final double mintemp;

  weathermodel(
      {required this.cityname,
      required this.date,
      required this.image,
      required this.status,
      required this.temp,
      required this.maxtemp,
      required this.mintemp});
  factory weathermodel.fromjson(json) {
    // Weathe_Body_Info(
    //   cityname: json["location"]["name"],
    //   date: json["current"]["last_updated"],
    //   temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
    //   maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
    //   mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
    //   status: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],);
    return weathermodel(
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      cityname: json["location"]["name"],
      date: json["current"]["last_updated"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      status: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }
}
