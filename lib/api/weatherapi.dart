import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_new_weather_app/api/Api_client.dart';
import 'package:my_new_weather_app/model/weatherModel.dart';

class WeatherApi {
  ApiClient apiClient = ApiClient();

  Future<Weathermodel> getWeather() async {
    Response response = await apiClient.invokeApi('malappuram', 'GET', null);
    return Weathermodel.fromJson(jsonDecode(response.body));
  }
}
