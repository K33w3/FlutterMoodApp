import 'package:flutter/material.dart';
import 'dart:math';

// Simulated data for friends' moods over the past 7 days
final List<Map<String, dynamic>> friendsData = [
  {
    'name': 'Alice',
    'moods': [5, 5, 6, 4, 3, 2, 1] // Friend has been feeling worse
  },
  {
    'name': 'Bob',
    'moods': [8, 7, 8, 9, 8, 7, 8] // Friend has been stable and good
  },
  {
    'name': 'Charlie',
    'moods': [3, 3, 4, 3, 2, 1, 1] // Friend needs attention (consecutive low)
  },
  {
    'name': 'Diana',
    'moods': [7, 8, 6, 5, 6, 7, 8] // Slight up and down but overall good
  },
];

class FriendsScreen extends StatelessWidget {
  final Function(String) onFriendSelected;

  const FriendsScreen({
    super.key,
    required this.onFriendSelected,
  });

  // Function to calculate the "hug need" score
  int calculateHugNeed(List<int> moods) {
    int hugScore = 0;

    for (int i = 1; i < moods.length; i++) {
      if (moods[i] < moods[i - 1]) {
        hugScore++; // If mood is declining, add to hug score
      }
    }

    // Extra points if the last two days are especially bad
    if (moods[moods.length - 1] <= 2) hugScore += 2;
    if (moods[moods.length - 2] <= 2) hugScore += 1;

    return hugScore; // Higher score = higher hug need
  }

  // Function to decide the color based on hug score
  Color getMoodColor(int hugScore) {
    if (hugScore >= 5) {
      return Colors.red; // Really needs a hug
    } else if (hugScore >= 3) {
      return Colors.orange; // Needs attention
    } else {
      return Colors.green; // Friend is doing well
    }
  }

  // Function to decide if the tile should shake
  bool shouldShake(int hugScore) {
    return hugScore >= 5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0FFFF), Color(0xFF89CFF0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text('Friends', style: TextStyle(color: Colors.black87)),
                centerTitle: true,
                iconTheme: const IconThemeData(color: Colors.black87),
              ),
              const SizedBox(height: 20),
              const Text(
                "How are your friends doing today?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87, // Changed text color
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Expanded(
                // Loop through friends' data and display each friend's status
                child: ListView(
                  children: friendsData.map((friend) {
                    List<int> moods = friend['moods'];
                    int hugScore = calculateHugNeed(moods);
                    return FriendTile(
                      name: friend['name'],
                      moodColor: getMoodColor(hugScore),
                      shouldShake: shouldShake(hugScore),
                      onFriendSelected: onFriendSelected,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// FriendTile widget for each friend
class FriendTile extends StatelessWidget {
  final String name;
  final Color moodColor;
  final bool shouldShake;
  final Function(String) onFriendSelected;

  const FriendTile({
    super.key,
    required this.name,
    required this.moodColor,
    required this.shouldShake,
    required this.onFriendSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onFriendSelected(name);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: shouldShake ? Curves.elasticIn : Curves.easeInOut,
          transform: shouldShake
              ? (Matrix4.translationValues(
              Random().nextDouble() * 10 - 5, 0, 0)) // Shake effect
              : Matrix4.identity(),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white, // Set background to white
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
            border: Border.all(color: moodColor, width: 1.5), // Use moodColor for border
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: moodColor, // Change the CircleAvatar color based on mood
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87, // Ensure the text color is readable on a white background
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.favorite, color: Colors.pink), // Hug icon
                  const SizedBox(width: 8),
                  Text(
                    'Send a Hug',
                    style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}