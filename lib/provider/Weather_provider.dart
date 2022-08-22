import 'package:flutter/material.dart';
import 'package:my_new_weather_app/api/weatherapi.dart';
import 'package:my_new_weather_app/model/weatherModel.dart';

class TrendingMoviesProvider with ChangeNotifier{
  late Weathermodel weathermodel;
 WeatherApi weatherApi = WeatherApi();

  bool loading =false;

  getWeatherApiData(context) async{
    loading = true;
    weathermodel = await weatherApi.getWeather();
    loading = false;
    notifyListeners();
  }
}