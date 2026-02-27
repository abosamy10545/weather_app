import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:weather_app/models/weather/weather_response.dart';

import 'package:weather_app/screens/home/home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.weatherList});
  final List<WeatherResponse> weatherList;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.8],
            colors: [Color(0xff595890), Colors.white],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: searchController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter location',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 17),

                  prefixIcon: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(city: searchController.text),
                        ),
                      );
                      setState(() {});
                    },
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 161, 160, 200),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: widget.weatherList.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 104,
                      width: 376,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          stops: [0.2, 0.9],
                          colors: [Color(0xff7e9fc7), Color(0xff8c99c2)],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.weatherList[index].location.name,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),

                                Row(
                                  children: [
                                    Text(
                                      'AQI 53',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '${widget.weatherList[index].current.tempC}°/ ${widget.weatherList[index].current.tempF}°',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '${widget.weatherList[index].current.tempC.toString()}°',
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Spacer(),
            SvgPicture.asset('assets/images/group18.svg', fit: BoxFit.fill),
          ],
        ),
      ),
    );
  }
}
