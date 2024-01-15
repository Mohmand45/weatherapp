import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoCard extends StatelessWidget {
  final WeatherModel weather;

  WeatherInfoCard({required this.weather});

  double _getTemperature() {
    double temperature = weather.list![0].main!.temp! - 273.15;
    return double.parse(temperature.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // City Name at the top center
              Text(
                weather.city!.name ?? 'Unknown City',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              // Temperature in large bold text at the center
              Text(
                '${_getTemperature()}°C',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              // Time and date just below the city name
              Text('Time: ${weather.list![0].dtTxt}'),
              SizedBox(height: 16.0),
              // Humidity, Wind Speed, and Visibility in a row at the bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text('Humidity: ${weather.list![0].main!.humidity}%'),
                  ),
                  Flexible(
                    child: Text('Wind Speed: ${weather.list![0].wind!.speed} m/s'),
                  ),
                  Flexible(
                    child: Text('Visibility: ${weather.list![0].visibility} m'),
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Add additional spacing
            ],
          ),
        ),
      ),
    );
  }
}
