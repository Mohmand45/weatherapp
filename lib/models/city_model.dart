import 'package:weather_app/models/weather_model.dart';
class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromMap(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    coord: json["coord"] == null ? null : Coord.fromMap(json["coord"]),
    country: json["country"],
    population: json["population"],
    timezone: json["timezone"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "coord": coord?.toMap(),
    "country": country,
    "population": population,
    "timezone": timezone,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}