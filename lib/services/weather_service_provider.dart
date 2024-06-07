import 'dart:convert';

import 'package:apiweatherapp/models/weather_response_model.dart';
import 'package:apiweatherapp/screts/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class WeatherServiceProvider extends ChangeNotifier{
  WeatherModel?_weather;

  WeatherModel? get weather=>_weather;


  bool _isloading=false;
  bool get isloading=>_isloading;


  String _error="";
  String get error=>_error;

  Future<void>fetchWeatherDataByCity(String city)async{
    _isloading = true;
    _error = "";
    // https://api.openweathermap.org/data/2.5/weather?q=dubai&appid=5c39cc61048ba8e8121721a91d7e12b3&units=metric

    try{
      final String apiUrl="${APIEndPoints().cityUrl}${city}&appid=${APIEndPoints().apikey}${APIEndPoints().unit}";
      print(apiUrl);
      final response= await http.get(Uri.parse(apiUrl));
      if(response.statusCode==200){
        final data = jsonDecode(response.body);
        print(data);
        _weather=WeatherModel.fromJson(data);
        notifyListeners();
      }else{
        _error="Failed to load data";
      }
    }catch(e){
      _error="Failed to load data $e";
    }finally{
      _isloading=false;
      notifyListeners();
    }

  }
}