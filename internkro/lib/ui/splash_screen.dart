import 'package:flutter/material.dart';
import 'package:internkro/style/color.dart';
import 'package:internkro/ui/home/home_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: statusbarColor,
      body: Center(
        child: Image.asset(
          'assets/images/internkro.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
