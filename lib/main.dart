import 'package:flutter/material.dart';
import 'package:test_weather/models/city.dart';
import 'package:test_weather/searchCity.dart';
import 'package:test_weather/weatherScreen.dart';

void main() => runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    // routes: {
    //   '/': (BuildContext context) => BodyForm(),
    //   '/weather_screen': (BuildContext context) => WeatherScreen()
    // },
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(
          builder: (BuildContext context) => makeRoute(
              context: context,
              routeName: settings.name,
              arguments: settings.arguments));
    }));

Widget makeRoute({BuildContext context, String routeName, Object arguments}) {
  switch (routeName) {
    case '/':
      return BodyForm();
      break;
    case '/weather_screen':
      City city = arguments as City;
      return WeatherScreen(city);
      break;
    default:
  }
}
