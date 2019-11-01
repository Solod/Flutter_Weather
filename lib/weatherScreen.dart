import 'package:flutter/material.dart';

import 'models/city.dart';

class WeatherScreen extends StatelessWidget {
  final City _city;

  WeatherScreen(this._city);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Weather screen')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Row(
            children: <Widget>[
              CircleImage('http://openweathermap.org/img/wn/04d@2x.png'),
              Text(_city.weatherData.temp.toString()),
            ],
          )),
        ));
  }
}

class CircleImage extends StatelessWidget {
  final String renderUrl;

  CircleImage(this.renderUrl);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
        color: Colors.greenAccent,
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: new NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }
}
