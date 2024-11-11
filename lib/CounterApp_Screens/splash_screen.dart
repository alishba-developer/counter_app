import 'dart:async';

import 'package:counter_app/CounterApp_Screens/counter_screen.dart';
import 'package:counter_app/CounterApp_Screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/1.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Image.asset(
                "assets/images/2.png",
                width: 300,
                height: 300,
              ),
            ),
            Text(
              "Counter App",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
// 'title': "Looks Good, Feel Good",
// 'desc':
// "The Counter App is a simple Flutter application that allows users to increment and decrement"
// " a displayed counter value.",
// 'image': "assets/images/3.jpg"
