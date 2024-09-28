import 'package:flutter/material.dart';
import 'package:fluapp/screens/home.dart'; // Import the home screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoodTrackerHome(), // Entry point: Home screen with slider
      debugShowCheckedModeBanner: false, // This removes the debug banner
    );
  }
}
