import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  final Function(String) onFriendSelected;

  FriendsScreen({
    super.key,
    required this.onFriendSelected,
  });

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
      // Use a gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0FFFF), Color(0xFF89CFF0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('Friends',
                  style: TextStyle(color: Colors.black87)),
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black87),
            ),
            const SizedBox(height: 20),
            const Text(
              "How are your friends doing today?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: friendsData.map((friend) {
                  List<int> moods = friend['moods'];
                  int hugScore = calculateHugNeed(moods);
                  return FriendTile(
                    name: friend['name'],
                    moodColor: getMoodColor(hugScore),
                    shouldShake: shouldShake(hugScore),
                    onFriendSelected: (name) {
                      onFriendSelected(name);
                      // Show hug confirmation dialog
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Hug Sent to $name!'),
                          content:
                              const Text('You made someone\'s day better!'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Convert FriendTile to StatefulWidget to manage animation state
class FriendTile extends StatefulWidget {
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
  _FriendTileState createState() => _FriendTileState();
}

class _FriendTileState extends State<FriendTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _shakeTimer;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Define the shaking animation
    _animation = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticIn),
    );

    // Start the periodic shaking if shouldShake is true
    if (widget.shouldShake) {
      _startShaking();
    }
  }

  void _startShaking() {
    _shakeTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        _controller.forward(from: 0);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _shakeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onFriendSelected(widget.name);
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final offset = _animation.value * sin(2 * pi * _controller.value);
          return Transform.translate(
            offset: Offset(offset, 0),
            child: child,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
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
              border: Border.all(
                  color: widget.moodColor,
                  width: 1.5), // Use moodColor for border
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: widget.moodColor,
                      // Change the CircleAvatar color based on mood
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .black87, // Ensure the text color is readable on a white background
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.pink), // Hug icon
                    SizedBox(width: 8),
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
      ),
    );
  }
}
