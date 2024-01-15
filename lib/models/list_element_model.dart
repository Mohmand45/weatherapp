import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
class ListElement {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Sys? sys;
  DateTime? dtTxt;
  Rain? rain;

  ListElement({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
    this.rain,
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
    dt: json["dt"],
    main: json["main"] == null ? null : Main.fromMap(json["main"]),
    weather: json["weather"] == null ? [] : List<Weather>.from(json["weather"]!.map((x) => Weather.fromMap(x))),
    clouds: json["clouds"] == null ? null : Clouds.fromMap(json["clouds"]),
    wind: json["wind"] == null ? null : Wind.fromMap(json["wind"]),
    visibility: json["visibility"],
    pop: json["pop"]?.toDouble(),
    sys: json["sys"] == null ? null : Sys.fromMap(json["sys"]),
    dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
    rain: json["rain"] == null ? null : Rain.fromMap(json["rain"]),
  );

  Map<String, dynamic> toMap() => {
    "dt": dt,
    "main": main?.toMap(),
    "weather": weather == null ? [] : List<dynamic>.from(weather!.map((x) => x.toMap())),
    "clouds": clouds?.toMap(),
    "wind": wind?.toMap(),
    "visibility": visibility,
    "pop": pop,
    "sys": sys?.toMap(),
    "dt_txt": dtTxt?.toIso8601String(),
    "rain": rain?.toMap(),
  };
}