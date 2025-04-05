import 'package:flutter/material.dart';

class LeftScreen extends StatelessWidget {
  const LeftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Screen 1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Icon(Icons.arrow_forward, color: Colors.white, size: 48),
          SizedBox(height: 20),
          Text(
            'Swipe right to chat',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
