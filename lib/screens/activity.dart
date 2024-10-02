import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  final int moodValue;

  // Example mood values for the last 6 days (excluding today)
  final List<int> weeklyMoodValues = [6, 5, 7, 6, 5, 7]; // Made-up mood values

  ActivityScreen({super.key, required this.moodValue});

  @override
  Widget build(BuildContext context) {
    // Create a full week mood list including today
    List<int> fullWeekMoodValues = List.from(weeklyMoodValues);
    fullWeekMoodValues.add(moodValue);

    // Analyze mood trends
    double averageMood =
        fullWeekMoodValues.reduce((a, b) => a + b) / fullWeekMoodValues.length;

    // Compare today's mood with yesterday's mood
    int yesterdayMood = weeklyMoodValues.last;
    int moodChangeValue = moodValue - yesterdayMood;
    String moodTrend;

    if (moodChangeValue > 0) {
      moodTrend = 'improving';
    } else if (moodChangeValue < 0) {
      moodTrend = 'declining';
    } else {
      moodTrend = 'stable';
    }

    List<String> recommendations =
        _getIntelligentActivityRecommendations(averageMood, moodTrend);

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
              'Your mood today is $moodValue/10',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Your average mood over the last week is ${averageMood.toStringAsFixed(1)}/10',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Your mood is $moodTrend compared to yesterday.',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Suggested activities based on your mood trends:',
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

  // Method to provide intelligent activity recommendations based on mood trends
  List<String> _getIntelligentActivityRecommendations(
      double averageMood, String moodTrend) {
    List<String> recommendations = [];

    // Recommendations based on average mood
    if (averageMood <= 4) {
      recommendations.add(
          'Your average mood has been low. Consider self-care activities.');
      recommendations.add('Reach out to friends or family for support.');
      recommendations
          .add('Engage in relaxing activities like meditation or yoga.');
      recommendations.add('Maintain a regular sleep schedule.');
    } else if (averageMood <= 7) {
      recommendations
          .add('Your average mood is moderate. Keep maintaining balance.');
      recommendations.add('Incorporate enjoyable hobbies into your routine.');
      recommendations.add('Stay active with regular exercise.');
      recommendations.add('Practice mindfulness or journaling.');
    } else {
      recommendations.add('Your average mood is high. Great job!');
      recommendations.add('Challenge yourself with new goals.');
      recommendations.add('Spread positivity by helping others.');
      recommendations.add('Plan an exciting activity or trip.');
    }

    // Recommendations based on mood trend
    if (moodTrend == 'improving') {
      recommendations
          .add('Your mood is improving. Keep up the positive habits.');
      recommendations
          .add('Reflect on what’s contributing to your better mood.');
      recommendations.add('Share your experiences with others.');
    } else if (moodTrend == 'declining') {
      recommendations
          .add('Identify any stressors and find ways to manage them.');
      recommendations.add('Take time to relax and engage in self-care.');
      recommendations.add('Consider talking to someone you trust.');
    } else {
      recommendations.add('Your mood is stable compared to yesterday.');
      recommendations.add('Maintain your current routine.');
      recommendations.add('Set small goals to boost your mood further.');
    }

    return recommendations;
  }
}
