import 'package:flutter/material.dart';
import 'package:my_new_weather_app/provider/Weather_provider.dart';
import 'package:my_new_weather_app/screen-home/Home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherProvider>(create: (_)=>WeatherProvider())

      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home:  WeatherHome()
    );
  }
}
