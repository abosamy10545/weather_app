import 'package:weather_app/models/weather/condition_model.dart';

class Day {
  final double maxTempC;
  final double minTempC;
  final Condition condition;
  final int avgHumidity;

  Day({
    required this.maxTempC,
    required this.minTempC,
    required this.condition,
    required this.avgHumidity,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxTempC: json['maxtemp_c'].toDouble(),
      minTempC: json['mintemp_c'].toDouble(),
      condition: Condition.fromJson(json['condition']),
      avgHumidity: json['avghumidity'],
    );
  }
}
