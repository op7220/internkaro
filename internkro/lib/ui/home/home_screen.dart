import 'package:flutter/material.dart';
import 'package:internkro/ui/home/DefaultContainerScreen.dart';
import 'package:internkro/ui/home/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "InternKro",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: MainDrawer(),
        body: DefaultContainerScreen());
  }
}
