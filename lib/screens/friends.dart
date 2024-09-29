import 'package:flutter/material.dart';
import 'package:fluapp/screens/hug.dart';

class FriendsScreen extends StatelessWidget {
  final int moodValue;
  const FriendsScreen({super.key, required this.moodValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Friend list and navigation trigger (dummy scroll)
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('F$index')),
                  title: Text('Friend $index'),
                  onTap: () {
                    _navigateToHugScreen(context, 'Friend $index');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Method to navigate with a fade transition
  void _navigateToHugScreen(BuildContext context, String recipientName) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HugScreen(recipientName: recipientName),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        },
      ),
    );
  }
}
