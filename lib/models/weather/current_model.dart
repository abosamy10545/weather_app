import 'package:weather_app/models/weather/condition_model.dart';

class Current {
  final double tempC;
  final double tempF;
  final bool isDay;
  final Condition condition;
  final double windKph;
  final int humidity;
  final double feelsLikeC;

  Current({
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.humidity,
    required this.feelsLikeC,
  });

 factory Current.fromJson(Map<String, dynamic> json) {
  return Current(
    tempC: (json['temp_c'] as num?)?.toDouble() ?? 0.0,
    tempF: (json['temp_f'] as num?)?.toDouble() ?? 0.0,
    isDay: json['is_day'] == 1,
    condition: Condition.fromJson(json['condition'] ?? {}),
    windKph: (json['wind_kph'] as num?)?.toDouble() ?? 0.0,
    humidity: json['humidity'] ?? 0,
    feelsLikeC: (json['feelslike_c'] as num?)?.toDouble() ?? 0.0,
  );
}

}
