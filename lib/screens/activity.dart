import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  final int moodValue;

  const ActivityScreen({super.key, required this.moodValue});

  @override
  Widget build(BuildContext context) {
    List<String> recommendations = _getActivityRecommendations(moodValue);

    return Scaffold(
      // Added a background gradient
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFEF9E7), Color(0xFFFFF3E0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Activity Recommendations',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87), // Changed text color
              ),
              const SizedBox(height: 20),
              Card(
                color: Colors.white.withOpacity(0.9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Your mood today is $moodValue/10',
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87), // Changed text color
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Suggested activities based on your mood:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87), // Changed text color
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: recommendations.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 5.0),
                      child: ListTile(
                        leading: const Icon(Icons.lightbulb_outline,
                            color: Colors.orange),
                        title: Text(
                          recommendations[index],
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87), // Changed text color
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to provide intelligent activity recommendations based on mood trends
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
