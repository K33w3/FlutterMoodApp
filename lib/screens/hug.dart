import 'package:flutter/material.dart';
import 'package:fluapp/screens/activity.dart';

class HugScreen extends StatelessWidget {
  final String recipientName;
  const HugScreen({super.key, required this.recipientName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Hug'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Virtual Hug sent to $recipientName!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToActivityScreen(context),
              child: const Text('See Activities'),
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

  void _navigateToActivityScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const ActivityScreen(moodValue: 4),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}
