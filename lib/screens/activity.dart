import 'package:flutter/material.dart';
import 'package:fluapp/screens/analy.dart'; // Import the AnalyScreen

class ActivityScreen extends StatelessWidget {
  final int moodValue;

  const ActivityScreen({Key? key, required this.moodValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Activity'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true, // Extend the body behind the app bar for full-screen
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Display the mood value in the header
            Text(
              'Your mood today was $moodValue/10',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Black text as requested
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Suggested activities header
            const Text(
              'Suggested activities for low moods:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Black text as requested
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Suggested activities list
            const Text(
              '• Going for a walk or jog\n'
                  '• Spending time on a hobby\n'
                  '• Talking to friends and family',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Black text as requested
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            // "See your Stats" button
            ElevatedButton(
              onPressed: () {
                // Navigate to AnalyScreen when "See your Stats" is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnalyScreen(), // Navigate to AnalyScreen
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent, // Button background color
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                ),
              ),
              child: const Text(
                'See your Stats',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            // "Go back" button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent, // Button background color
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                ),
              ),
              child: const Text(
                'Go back',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
