import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/screens/home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(height: 260),
            SvgPicture.asset(
              'assets/images/group16.svg',
              width: 293,
              height: 210,
            ),
            Text(
              'weather',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            Text('@wolf', style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 180),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen(city: 'alex',)),
                );
              },
              child: Container(
                width: 166,
                height: 47,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.2, 0.9],
                    colors: [Color(0xff4da6d9), Color(0xffb1d8ee)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "let's start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
