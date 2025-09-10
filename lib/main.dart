import 'package:flutter/material.dart';
import 'package:weather_app/weather_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget{
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //making the debug banner removed
      debugShowCheckedModeBanner: false,
      //setting the theme for entire app globally instead of setting bgcolor for every page and use material3
      theme: ThemeData.dark(useMaterial3: true),
      
      home: const WeatherScreen(),
    );
  }
}

