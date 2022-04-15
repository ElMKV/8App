import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_for_8_app/Model/WeatherModel.dart';
Future<List> getHttp(city) async {
  List mes=[];
  var options = BaseOptions(
    connectTimeout: 15000,
    receiveTimeout: 13000,
  );
  try {
    var response = await Dio(options).get('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=be4db212f5d288bb8b23fd786a9bc238&lang=ru&units=metric');
    final userdata = new WeatherModel.fromJson(response.data);
    mes.add(true);
    mes.add(userdata.weather[0].icon);
    mes.add(userdata.main.feelsLike.round().toString());
    mes.add(userdata.name);
    return mes;
  }
  on DioError catch (e){
    print(e.type.index);
    mes.add(false);
    mes.add(e.type.index);
    return mes;
  }


}