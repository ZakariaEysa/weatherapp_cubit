class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final String status;
  final double temp;
  final double maxTemp;
  final double minTemp;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.status,
      required this.temp,
      required this.maxTemp,
      required this.minTemp});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      cityName: json["location"]["name"],
      date: DateTime.parse(json["current"]["last_updated"]),
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      status: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }
}
