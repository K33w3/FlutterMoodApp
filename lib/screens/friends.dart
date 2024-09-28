import 'package:flutter/material.dart';
import 'package:fluapp/screens/hug.dart'; // Import HugScreen for navigation

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  bool hasNavigated = false; // Flag to check if navigation has occurred

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        centerTitle: true,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            // Check if the user has scrolled to the end of the scroll view
            if (scrollNotification.metrics.pixels >=
                    scrollNotification.metrics.maxScrollExtent &&
                !hasNavigated) {
              // Set flag to true to prevent multiple navigations
              hasNavigated = true;

              // Navigate to HugScreen when scrolled to the bottom
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HugScreen(
                          recipientName: 'Noah',
                        )),
              ).then((_) {
                // Reset flag when returning to Friends page
                hasNavigated = false;
              });
              return true; // Stop further processing of the notification
            }
          }
          return false; // Allow further processing of the notification
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Friend list items
                FriendTile(name: "FRIEND 1"),
                FriendTile(name: "FRIEND 2"),
                FriendTile(name: "FRIEND 3"),
                FriendTile(name: "FRIEND 4"),
                const SizedBox(height: 40),
                // Pagination dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(backgroundColor: Colors.grey, radius: 6),
                    SizedBox(width: 8),
                    CircleAvatar(backgroundColor: Colors.grey, radius: 6),
                    SizedBox(width: 8),
                    CircleAvatar(backgroundColor: Colors.grey, radius: 6),
                  ],
                ),
                const SizedBox(height: 40),
                // Downward arrow
                const Icon(
                  Icons.arrow_downward,
                  size: 50,
                ),
                const SizedBox(height: 1000), // Extend the scrollable content
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// FriendTile widget for each friend
class FriendTile extends StatelessWidget {
  final String name;

  const FriendTile({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person),
          ),
          title: Text(name),
        ),
      ),
    );
  }
}
