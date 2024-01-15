import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';

class FiveDayForecastCard extends StatelessWidget {
  final List<ListElement> fiveDayForecast;

  FiveDayForecastCard({required this.fiveDayForecast});

  @override
  Widget build(BuildContext context) {
    // Group the data by date
    Map<String, List<ListElement>> groupedData = {};

    for (var element in fiveDayForecast) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(element.dtTxt!);
      if (!groupedData.containsKey(formattedDate)) {
        groupedData[formattedDate] = [element];
      } else {
        groupedData[formattedDate]!.add(element);
      }
    }

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 50.0, // Adjust the height as needed
          flexibleSpace: FlexibleSpaceBar(
            title: Center(
              child: Text(
                'Next 5 Days Forecast',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              // Use the first data point for each date
              ListElement firstDataPoint = groupedData.entries.elementAt(index).value.first;

              // Extract relevant data for each day
              String formattedDate =
              DateFormat('EEE, MMM d').format(firstDataPoint.dtTxt!);
              double temperature = firstDataPoint.main!.temp! - 273.15;
              int humidity = firstDataPoint.main!.humidity!;

              return _buildDayCard(
                formattedDate: formattedDate,
                temperature: temperature,
                humidity: humidity,
              );
            },
            childCount: groupedData.length,
          ),
        ),
      ],
    );
  }

  Widget _buildDayCard({
    required String formattedDate,
    required double temperature,
    required int humidity,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(formattedDate),
        subtitle: Text(
          'Temperature: ${temperature.toStringAsFixed(2)}°C, Humidity: $humidity%',
        ),
      ),
    );
  }
}
