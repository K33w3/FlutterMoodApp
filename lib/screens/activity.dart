import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  final int moodValue;

  const ActivityScreen({super.key, required this.moodValue});

  @override
  Widget build(BuildContext context) {
    List<String> recommendations = _getActivityRecommendations(moodValue);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Activities'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Your mood today was $moodValue/10',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Suggested activities based on your mood:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: recommendations.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: Text(
                      recommendations[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to provide intelligent activity recommendations based on mood value
  List<String> _getActivityRecommendations(int mood) {
    if (mood <= 3) {
      return [
        'Take a break and do something relaxing',
        'Go for a short walk outside to refresh your mind',
        'Watch a comforting movie or show',
        'Talk to a close friend or family member',
        'Try some light meditation or breathing exercises',
      ];
    } else if (mood <= 6) {
      return [
        'Engage in a hobby like drawing or reading',
        'Take a brisk walk or light exercise',
        'Listen to uplifting music',
        'Plan a small, enjoyable activity for later',
        'Cook a meal or bake something simple',
      ];
    } else if (mood <= 8) {
      return [
        'Do a workout or go for a jog',
        'Spend time outdoors in nature',
        'Catch up with a friend',
        'Work on a passion project or learn something new',
        'Write down something positive about your day',
      ];
    } else {
      return [
        'Tackle a big project or activity you’ve been putting off',
        'Host a gathering or virtual hangout with friends',
        'Take a challenging hike or outdoor adventure',
        'Treat yourself to something you enjoy (a meal, a show, etc.)',
        'Write down your goals for the week and get started on them',
      ];
    }
  }
}
