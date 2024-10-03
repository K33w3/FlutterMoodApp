import 'package:flutter/material.dart';
import 'package:fluapp/screens/friends.dart';
import 'package:fluapp/screens/hug.dart';
import 'package:fluapp/screens/activity.dart';
import 'package:fluapp/screens/analy.dart';

class MoodTrackerHome extends StatefulWidget {
  const MoodTrackerHome({super.key});

  @override
  _MoodTrackerHomeState createState() => _MoodTrackerHomeState();
}

class _MoodTrackerHomeState extends State<MoodTrackerHome> {
  double _currentSliderValue = 5;
  String? recipientName;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // Build the pages list dynamically, excluding the HugScreen if no friend is selected
    List<Widget> pages = [
      // Mood Slider View (First Page)
      Padding(
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
          ],
        ),
      ),
      // Friends Screen (Second Page)
      FriendsScreen(
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
      // Only add HugScreen if a friend is selected
      if (recipientName != null)
        HugScreen(
          recipientName: recipientName ?? '',
          moodValue: _currentSliderValue.round(),
        ),
      // Activity Screen (Next Page, after HugScreen or FriendsScreen)
      ActivityScreen(moodValue: _currentSliderValue.round()),
      // Analytics Screen (Last Page)
      const AnalyScreen(),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: (int pageIndex) {
          // Unselect the friend and remove HugScreen when the user scrolls away from HugScreen
          if (pageIndex != 2 && recipientName != null) {
            setState(() {
              recipientName = null;
            });
          }
        },
        children: pages,
      ),
    );
  }
}
