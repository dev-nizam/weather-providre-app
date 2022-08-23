import 'package:flutter/material.dart';
import 'package:my_new_weather_app/api/weatherapi.dart';
import 'package:my_new_weather_app/model/weatherModel.dart';

class WeatherProvider with ChangeNotifier{
  late Weathermodel weathermodel;
 WeatherApi weatherApi = WeatherApi();

  bool loading =false;

  getWeatherApiData(context, String place) async{
    loading = true;
    weathermodel = await weatherApi.getWeather(place: place);
    loading = false;
    notifyListeners();
  }
}