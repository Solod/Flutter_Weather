
class City {
  WeatherDataMain weatherData;

  City({this.weatherData});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(weatherData: WeatherDataMain.fromJson(json['main']));
  }
  
}

class WeatherDataMain {
  final double temp;
  final int pressure;
  final int humidity;
  final double tempMin;
  final double tempMax;

  WeatherDataMain(
      {this.temp, this.pressure, this.humidity, this.tempMax, this.tempMin});

  factory WeatherDataMain.fromJson(Map<String,dynamic> json){
    return WeatherDataMain(
      temp: json['temp'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max']
    );
  }
}
