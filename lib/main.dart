import 'package:flutter/material.dart';
import 'package:weather_app/presentations/screens/weather_home_page.dart';
import 'package:weather_app/presentations/screens/weather_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherPage(),
    );
  }
}
