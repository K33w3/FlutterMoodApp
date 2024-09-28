import 'package:flutter/material.dart';

class AnalyScreen extends StatelessWidget {
  const AnalyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Statistics'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Statistics section with user profile picture
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your Statistics',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // User profile picture placeholder
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 30, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'User Profile Picture',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Statistics grid
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2,
              children: const <Widget>[
                StatCard(value: '109 days'),
                StatCard(value: '1 day'),
                StatCard(value: '9 days'),
                StatCard(value: '19 days'),
              ],
            ),
            const SizedBox(height: 30),
            // Mood section
            const Text(
              'Your Mood',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Mood progress bars
            MoodBar(percentage: 0.7),
            MoodBar(percentage: 0.5),
            MoodBar(percentage: 0.3),
            MoodBar(percentage: 0.9),
          ],
        ),
      ),
    );
  }
}

// Widget for Statistics Cards
class StatCard extends StatelessWidget {
  final String value;
  const StatCard({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Widget for Mood Bars
class MoodBar extends StatelessWidget {
  final double percentage;
  const MoodBar({Key? key, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          value: percentage,
          backgroundColor: Colors.grey[300],
          color: Colors.black,
          minHeight: 20,
        ),
      ),
    );
  }
}
