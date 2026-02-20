import 'package:weather_app/models/weather/current_model.dart';
import 'package:weather_app/models/weather/forecast_model.dart';
import 'package:weather_app/models/weather/location_model.dart';


class WeatherResponse {
  final Location location;
  final Current current;
  final Forecast forecast;

  WeatherResponse({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }
}
