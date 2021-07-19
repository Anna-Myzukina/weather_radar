import 'package:flutter/material.dart';
import 'package:weather_radar/screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Weather app',
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}


