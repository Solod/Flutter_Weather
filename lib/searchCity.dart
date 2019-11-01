import 'dart:convert';

import 'package:progress_dialog/progress_dialog.dart';
import 'package:test_weather/models/city.dart';
import 'package:test_weather/weatherScreen.dart';
import 'const/apiConst.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class BodyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyFormState();
}

class _BodyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  final textCityControler = TextEditingController();

  ProgressDialog progressDialog;

  @override
  void dispose() {
    textCityControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context);
    progressDialog.style(message: 'wait please!');
    return new Scaffold(
        appBar: new AppBar(title: new Text('Search Weather')),
        body: new Container(
            padding: EdgeInsets.all(10.0),
            child: new Form(
                key: _formKey,
                child: new Column(
                  children: <Widget>[
                    new Text('Введите город:',
                        style: TextStyle(fontSize: 20.0)),
                    new TextFormField(
                      controller: textCityControler,
                      validator: (value) {
                        if (value.isEmpty) return 'Введите название города!';
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: new RaisedButton(
                            onPressed: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              if (_formKey.currentState.validate()) {
                                progressDialog.show();
                                _getCityWeather(textCityControler.text)
                                    .then((onValue) {
                                  progressDialog.hide();
                                  Navigator.pushNamed(context, '/weather_screen', arguments: onValue);
                                }).catchError((onError) {
                                  progressDialog.hide();
                                  print('request Bad: ${onError.toString()}');
                                });
                              }
                            },
                            child: Text('Получить'),
                            color: Colors.blue,
                            textColor: Colors.white))
                  ],
                ))));
  }

  Future<City> _getCityWeather(String cityText) async {
    final responce = await http.get(
        '${ApiConst.BASE_URL}${ApiConst.METHOD}q=$cityText${ApiConst.API_KEY}${ApiConst.UNIT_METRICK}');
    if (responce.statusCode == 200) {
      print(responce.body);
      return City.fromJson(json.decode(responce.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
