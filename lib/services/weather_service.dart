import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String apiKey = '7a198558db116efbf306a3a36d959445'; // Replace with your OpenWeatherMap API key

  Future<WeatherModel?> fetchWeatherData(String cityName) async {
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final weatherData = WeatherModel.fromMap(json);
      return weatherData;
    } else {
      // Handle error
      print('Failed to load weather data');
      return null;
    }
  }

  Future<WeatherModel?> fetchWeatherDataByLocation(
      double latitude, double longitude) async {
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final weatherData = WeatherModel.fromMap(json);
      return weatherData;
    } else {
      // Handle error
      print('Failed to load weather data');
      return null;
    }
  }
}