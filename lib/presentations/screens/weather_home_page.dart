import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/presentations/screens/5days_forecast.dart';
import 'package:weather_app/presentations/widgets/custom_appbar.dart';
import 'package:weather_app/presentations/widgets/search_bar.dart';
import 'package:weather_app/presentations/widgets/weather_detail_card.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherModel? _weatherData;

  @override
  void initState() {
    super.initState();
    _fetchWeatherForCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomSearchBar(onSearch: _fetchWeatherData),
          SizedBox(height: 16),
          _weatherData != null
              ? WeatherInfoCard(weather: _weatherData!)
              : Text('No data available'),
          Expanded(
            child: _weatherData != null
                ? FiveDayForecastCard(
              fiveDayForecast: _weatherData!.list!,
            )
                : Text('No data available'),
          ),
        ],
      ),
    );
  }

  Future<void> _fetchWeatherData(String cityName) async {
    final weatherService = WeatherService();
    final weatherData = await weatherService.fetchWeatherData(cityName);
    setState(() {
      _weatherData = weatherData;
    });
  }

  Future<void> _fetchWeatherForCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      final weatherService = WeatherService();
      final weatherData = await weatherService.fetchWeatherDataByLocation(
          position.latitude, position.longitude);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      print("Error getting current location: $e");
    }
  }
}
