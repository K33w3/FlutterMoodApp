import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  final int moodValue;
  final Function(String) onFriendSelected;

  const FriendsScreen({
    super.key,
    required this.moodValue,
    required this.onFriendSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Replaced background image with gradient
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF89CFF0), Color(0xFFE0FFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('Friends',
                  style: TextStyle(color: Colors.black87)),
              // Changed text color
              centerTitle: true,
              iconTheme: const IconThemeData(
                  color: Colors.black87), // Changed icon color
            ),
            const SizedBox(height: 20),
            const Text(
              "How are your friends doing today?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Changed text color to darker
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Friend list items with placeholder icons
            Expanded(
              child: ListView(
                children: [
                  FriendTile(name: "Alice", onFriendSelected: onFriendSelected),
                  FriendTile(name: "Bob", onFriendSelected: onFriendSelected),
                  FriendTile(
                      name: "Charlie", onFriendSelected: onFriendSelected),
                  FriendTile(name: "Diana", onFriendSelected: onFriendSelected),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// FriendTile widget for each friend
class FriendTile extends StatelessWidget {
  final String name;
  final Function(String) onFriendSelected;

  const FriendTile({
    super.key,
    required this.name,
    required this.onFriendSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onFriendSelected(name);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person,
                    size: 30, color: Colors.white), // Placeholder icon
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(Icons.favorite, color: Colors.pink, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
