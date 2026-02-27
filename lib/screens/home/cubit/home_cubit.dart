import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/services/api_constants.dart';
import 'package:weather_app/models/weather/weather_response.dart';
import 'package:weather_app/screens/home/home_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  Dio dio = Dio();
  List<WeatherResponse> weatherList = [];

  Future<WeatherResponse> getWeather({required String city}) async {
    try {
      emit(HomeLoading());
      Response response = await dio.get(
        '${ApiConstants.baseUrl}forecast.json?key=${ApiConstants.apiKey}&q=$city&days=5&aqi=no&alerts=no',
      );
      String image = await getImage(city);

      WeatherResponse weatherResponse = WeatherResponse.fromJson(response.data);
     
      weatherList.add(weatherResponse);
      emit(
        HomeSuccess(
          weatherResponse: weatherResponse,
          weatherList: List.from(weatherList),
          image: image,
        ),
      );
      return weatherResponse;
    } catch (e) {
      emit(HomeError(error: e.toString()));
      print(e);
      throw Exception('Failed to load dat $e');
    }
  }

  Future getImage(String city) async {
    try {
      Response response = await dio.get(
        'https://api.pexels.com/v1/search?query=$city',
        options: Options(
          headers: {
            "Authorization":
                "kYDrhY3HTn55vbFWh3RS66zm85L17eD0nzTi1cupBUmUYsR0U2GTxrUZ",
          },
        ),
      );
      return response.data['photos'][0]['src']['portrait'];
    } catch (e) {
      throw Exception('Failed to load dat $e');
    }
  }
}
