import 'package:flutter/material.dart';
import 'package:fluapp/screens/analy.dart';

class ActivityScreen extends StatelessWidget {
  final int moodValue;
  const ActivityScreen({super.key, required this.moodValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Activity'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your mood today was $moodValue/10'),
            ElevatedButton(
              onPressed: () => _navigateToAnalyScreen(context),
              child: const Text('See Stats'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAnalyScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const AnalyScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        },
      ),
    );
  }
}
