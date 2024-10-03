import 'package:flutter/material.dart';

class HugScreen extends StatelessWidget {
  final String recipientName;
  final int moodValue;

  const HugScreen({
    super.key,
    required this.recipientName,
    required this.moodValue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Added a background image
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/hug_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.favorite, color: Colors.pink, size: 80),
                const SizedBox(height: 20),
                Text(
                  'Virtual Hug sent to $recipientName!',
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'You made someone\'s day better!',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
