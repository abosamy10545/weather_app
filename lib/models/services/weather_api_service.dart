import 'package:dio/dio.dart';
import 'package:weather_app/models/services/api_constants.dart';
import 'package:weather_app/models/weather/weather_response.dart';

class WeatherApiService {
  Dio dio = Dio();
  String? image;
  Future<WeatherResponse> getWeather({required String city}) async {
    try {
      Response response = await dio.get(
        '${ApiConstants.baseUrl}forecast.json?key=${ApiConstants.apiKey}&q=$city&days=4&aqi=no&alerts=no',
      );
      image = await getImage(city);
      print(response.data);
      return WeatherResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      throw Exception('Failed to load dat $e');
    }
  }

  Future getImage(String city) async {
    try {
      Response response = await dio.get(
        'https://api.pexels.com/v1/search?query=$city',
      );
      return response.data['photos'][0]['src']['portrait'];
    } catch (e) {
      throw Exception('Failed to load dat $e');
    }
  }
}
