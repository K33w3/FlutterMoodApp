import 'package:flutter/material.dart';
import 'package:fluapp/screens/activity.dart'; // Import ActivityScreen

class HugScreen extends StatelessWidget {
  final String recipientName;

  const HugScreen({Key? key, required this.recipientName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Hug'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true, // Allow the body to extend behind the app bar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Virtual Hug text
            const Text(
              'Virtual Hug sent to',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Recipient's Name
            Text(
              '$recipientName!',
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            // See Activities Button
            ElevatedButton(
              onPressed: () {
                // Navigate to ActivityScreen when "See Activities" is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ActivityScreen(moodValue: 4),
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
                'See Activities',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            // Go Back Button
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
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
