import 'package:flutter/material.dart';

class HugScreen extends StatelessWidget {
  final String recipientName;
  final int moodValue;

  const HugScreen({
    super.key,
    required this.recipientName,
    required this.moodValue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hug Sent'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Virtual Hug sent to $recipientName!',
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
