import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:weather_app/models/weather/weather_response.dart';
import 'package:weather_app/screens/home/cubit/home_cubit.dart';
import 'package:weather_app/screens/home/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.city});
  final String city;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherResponse? weatherResponse;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getWeather(city: widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
          Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        } else if (state is HomeSuccess) {
          weatherResponse = state.weatherResponse;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is HomeLoading
              ? Center(child: CircularProgressIndicator())
              : state is HomeSuccess
              ? Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(state.image),
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
                            MaterialPageRoute(
                              builder: (context) =>
                                  SearchScreen(weatherList: state.weatherList),
                            ),
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
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 170,
                      left: 0,
                      right: 0,
                      child: Text(
                        '${weatherResponse?.current.tempC.toString() ?? ''}°',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 270,
                      left: 0,
                      right: 0,
                      child: Text(
                        'clear ${weatherResponse?.current.tempC.toDouble() ?? ''}°/ ${weatherResponse?.current.tempF.toDouble() ?? ''}°',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
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
                                // 👇 LiquidGlass forecast section
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '5-day forecast',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),

                                      const Text(
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
                                
                                if (weatherResponse != null)
                                  Column(
                                    children: weatherResponse!
                                        .forecast
                                        .forecastDay
                                        .take(5)
                                        .map((forecastDay) {
                                          final day = forecastDay.day;
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8,
                                              horizontal: 15,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  forecastDay.date,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "${day.maxTempC}°C / ${day.minTempC}°F",
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        })
                                        .toList(),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(child: Text('error')),
        );
      },
    );
  }
}
