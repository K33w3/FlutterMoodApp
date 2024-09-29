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
      appBar: AppBar(
        title: const Text('Friends'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            const Text(
              "How are your friends doing today?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Friend list items with clear hug interaction
            FriendTile(name: "FRIEND 1", onFriendSelected: onFriendSelected),
            FriendTile(name: "FRIEND 2", onFriendSelected: onFriendSelected),
            FriendTile(name: "FRIEND 3", onFriendSelected: onFriendSelected),
            FriendTile(name: "FRIEND 4", onFriendSelected: onFriendSelected),
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
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.blueAccent, width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    );
  }
}
