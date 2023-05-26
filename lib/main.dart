import 'package:flutter/material.dart';
import 'package:music_player/screens/home_screen.dart';
import 'package:music_player/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
