import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:weather_app/models/services/weather_api_service.dart';
import 'package:weather_app/models/weather/weather_response.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.city});
  final String city;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherApiService weatherApi = WeatherApiService();
  WeatherResponse? weatherResponse;
  @override
  void initState() {
    weatherApi.getWeather(city: widget.city).then((value) {
      setState(() {
        weatherResponse = value;
      });
      weatherList.add(weatherResponse!);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  weatherApi.image ??
                      'https://images.pexels.com/photos/33481470/pexels-photo-33481470.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 10,

            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
              icon: Icon(Icons.search, size: 32, color: Colors.black),
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Text(
              weatherResponse?.location.name.toString() ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: Text(
              '${weatherResponse?.current.tempC.toString() ?? ''}°',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            top: 270,
            left: 0,
            right: 0,
            child: Text(
              'clear ${weatherResponse?.current.tempC.toDouble() ?? ''}°/ ${weatherResponse?.current.tempF.toDouble() ?? ''}°',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            top: 310,
            left: 0,
            right: 0,
            child: Center(
              child: LiquidGlassLayer(
                child: LiquidGlass(
                  shape: LiquidRoundedSuperellipse(borderRadius: 30),
                  child: SizedBox(
                    height: 39,
                    width: 111,
                    child: Center(
                      child: Text(
                        '🌿 AQI 53',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: LiquidGlassLayer(
              child: LiquidGlass(
                shape: LiquidRoundedSuperellipse(borderRadius: 30),
                child: SizedBox(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '5-day forecast',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'More details ‣',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),

                      Expanded(
                        child: ListView.builder(
                          itemCount:
                              weatherResponse?.forecast.forecastDay.length ?? 0,
                          itemBuilder: (context, index) {
                            final day = weatherResponse!
                                .forecast
                                .forecastDay[index]
                                .day;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '🌤️mon clear',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${day.maxTempC}° / ${day.minTempC}°',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<WeatherResponse> weatherList = [];
