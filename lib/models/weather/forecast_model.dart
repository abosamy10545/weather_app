import 'package:weather_app/models/weather/forecast_day_model.dart';

class Forecast {
  final List<ForecastDay> forecastDay;

  Forecast({required this.forecastDay});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastDay: (json['forecastday'] as List)
          .map((e) => ForecastDay.fromJson(e))
          .toList(),
    );
  }
}
