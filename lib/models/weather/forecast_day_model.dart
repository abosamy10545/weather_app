import 'package:weather_app/models/weather/astro_model.dart';
import 'package:weather_app/models/weather/day_model.dart';
import 'package:weather_app/models/weather/hour_model.dart';

class ForecastDay {
  final String date;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  ForecastDay({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'],
      day: Day.fromJson(json['day']),
      astro: Astro.fromJson(json['astro']),
      hour: (json['hour'] as List)
          .map((e) => Hour.fromJson(e))
          .toList(),
    );
  }
}
