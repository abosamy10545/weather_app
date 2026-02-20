import 'package:weather_app/models/weather/condition_model.dart';

class Hour {
  final String time;
  final double tempC;
  final Condition condition;
  final double windKph;

  Hour({
    required this.time,
    required this.tempC,
    required this.condition,
    required this.windKph,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      time: json['time'],
      tempC: json['temp_c'].toDouble(),
      condition: Condition.fromJson(json['condition']),
      windKph: json['wind_kph'].toDouble(),
    );
  }
}
