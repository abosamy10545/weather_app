import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  'https://lh5.googleusercontent.com/proxy/WZqK-8yShdBNaakEegUbs-0IF1RdHJLTxrJlm7yuIp7KG8dfyR_ZhkvRGydWl-mOxI82HLk4I_7-1ZKPlAknitC7zwRTtEYdHKQmMPFOng',
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
              'Alexandra',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Text(
              '38°',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            top: 290,
            left: 0,
            right: 0,
            child: Text(
              'clear  38° / 25°',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            top: 320,
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
            bottom: -90,
            left: 10,
            right: 10,
            child: LiquidGlassLayer(
              child: LiquidGlass(
                shape: LiquidRoundedSuperellipse(borderRadius: 30),
                child: const SizedBox(
                  height: 275,
                  width: 410,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '5-day forecast',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'More details ‣',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '🌤️ Mon clear',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '39° / 26°',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '☀️ Tue clear',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              ' 39° / 26°',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
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
