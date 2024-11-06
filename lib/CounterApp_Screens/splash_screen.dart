import 'dart:async';

import 'package:counter_app/CounterApp_Screens/counter_screen.dart';
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
    Timer(Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> CounterScreen()
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/2.png",width: 400,height: 300,),
            Text("Counter App",style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontStyle: FontStyle.italic
            ),)
          ],
        ),
      ),
    );
  }
}
