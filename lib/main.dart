import 'package:flutter/material.dart';

import 'homeScreen.dart';

void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  static const Color _backgroundColor = Color(0xFF0A0E21);
  static const Color _accentColor = Color(0xFFEB1555);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: _backgroundColor,
        scaffoldBackgroundColor: _backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: _backgroundColor,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        sliderTheme: const SliderThemeData(
          activeTrackColor: _accentColor,
          thumbColor: _accentColor,
          overlayColor: Color(0x29EB1555),
          inactiveTrackColor: Color(0xFF8D8E98),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
