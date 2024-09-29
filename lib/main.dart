import 'package:flutter/material.dart';
import 'package:fluapp/screens/home.dart';

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
      home: const MoodTrackerHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
