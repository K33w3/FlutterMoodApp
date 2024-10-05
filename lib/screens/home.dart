import 'package:fluapp/screens/activity.dart';
import 'package:fluapp/screens/analy.dart';
import 'package:fluapp/screens/friends.dart';
import 'package:fluapp/screens/hug.dart';
import 'package:flutter/material.dart';

class MoodTrackerHome extends StatefulWidget {
  const MoodTrackerHome({super.key});

  @override
  _MoodTrackerHomeState createState() => _MoodTrackerHomeState();
}

class _MoodTrackerHomeState extends State<MoodTrackerHome> {
  double _currentSliderValue = 7;
  String? recipientName;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF89CFF0), Color(0xFFE0FFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          children: [
            // Mood Slider View
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'How are you feeling today?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87, // Changed text color to darker
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Slide to select your mood',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    // Changed text color to darker
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  // Mood Emoji based on slider value
                  Text(
                    _getMoodEmoji(_currentSliderValue.round()),
                    style: const TextStyle(fontSize: 100),
                  ),
                  const SizedBox(height: 40),
                  // Mood slider
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 24.0),
                      activeTrackColor: Colors.black87,
                      // Changed to darker color
                      inactiveTrackColor: Colors.black26,
                      // Changed to darker color
                      thumbColor: Colors.black87,
                      // Changed to darker color
                      overlayColor: Colors.black26, // Changed to darker color
                    ),
                    child: Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 10,
                      divisions: 10,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Scroll down to continue',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54), // Changed text color to darker
                  ),
                ],
              ),
            ),
            // Friends Screen
            FriendsScreen(
              moodValue: _currentSliderValue.round(),
              onFriendSelected: (String name) {
                setState(() {
                  recipientName = name;
                });
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            // Hug Screen
            HugScreen(
              recipientName: recipientName ?? '',
              moodValue: _currentSliderValue.round(),
            ),
            // Activity Screen
            ActivityScreen(moodValue: _currentSliderValue.round()),
            // Analytics Screen
            const AnalyScreen(),
          ],
        ),
      ),
    );
  }

  // Method to get mood emoji based on slider value
  String _getMoodEmoji(int moodValue) {
    if (moodValue <= 2) {
      return '😞';
    } else if (moodValue <= 4) {
      return '😕';
    } else if (moodValue <= 6) {
      return '😐';
    } else if (moodValue <= 8) {
      return '🙂';
    } else {
      return '😄';
    }
  }
}
