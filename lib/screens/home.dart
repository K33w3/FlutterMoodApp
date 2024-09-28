import 'package:flutter/material.dart';
import 'package:fluapp/screens/overview.dart'; // Import the overview page

class MoodTrackerHome extends StatefulWidget {
  const MoodTrackerHome({super.key});

  @override
  _MoodTrackerHomeState createState() => _MoodTrackerHomeState();
}

class _MoodTrackerHomeState extends State<MoodTrackerHome> {
  double _currentSliderValue = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Mood View Slider"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'How are you feeling today?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Click one of the following options',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            // Placeholder for the image box
            Container(
              height: 200,
              width: 200,
              color: Colors.grey[300],
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Mood slider
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 10,
              divisions: 10,
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Continue Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the OverviewScreen with the slider value
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OverviewScreen(
                      moodValue: _currentSliderValue.round(),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
