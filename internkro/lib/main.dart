import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internkro/constant.dart';
import 'package:internkro/style/color.dart';
import 'package:internkro/ui/forgotpass/forgot_password.dart';
import 'package:internkro/ui/home/DefaultContainerScreen.dart';
import 'package:internkro/ui/home/home_screen.dart';
import 'package:internkro/ui/login/login_screen.dart';
import 'package:internkro/ui/signup/signup_screen.dart';
import 'package:internkro/ui/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        //statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
        ));
    return MaterialApp(
      title: 'Internkro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => HomeScreen(),
        ANIMATED_SPLASH: (BuildContext context) => new SplashScreen(),
        LOGIN_SCREEN: (BuildContext context) => LoginScreen(),
        SIGNUP_SCREEN: (BuildContext context) => SignUpScreen(),
        FORGOT_SCREEN: (BuildContext context) => ForgotPassword(),
        DEFAULT_CONTAINER_SCREEN: (BuildContext context) =>
            DefaultContainerScreen()
      },
    );
  }
}
