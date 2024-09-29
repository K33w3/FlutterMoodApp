import 'package:flutter/material.dart';

class AnalyScreen extends StatelessWidget {
  const AnalyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for demonstration
    final List<double> moodData = [0.7, 0.5, 0.3, 0.9];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Statistics'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your Statistics',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
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
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2,
              children: const <Widget>[
                StatCard(title: 'Total Days', value: '109'),
                StatCard(title: 'Streak', value: '1'),
                StatCard(title: 'Best Streak', value: '9'),
                StatCard(title: 'Hugs Sent', value: '19'),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Your Mood Over Time',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Display mood bars
            Expanded(
              child: ListView.builder(
                itemCount: moodData.length,
                itemBuilder: (context, index) {
                  return MoodBar(
                    day: 'Day ${index + 1}',
                    percentage: moodData[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for Statistics Cards
class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueAccent, width: 1.5),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for Mood Bars
class MoodBar extends StatelessWidget {
  final String day;
  final double percentage;

  const MoodBar({super.key, required this.day, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[300],
              color: Colors.blueAccent,
              minHeight: 20,
            ),
          ),
        ],
      ),
    );
  }
}
