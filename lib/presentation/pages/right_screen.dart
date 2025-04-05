import 'package:flutter/material.dart';

class RightScreen extends StatelessWidget {
  const RightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Screen 3',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Icon(Icons.arrow_back, color: Colors.white, size: 48),
          SizedBox(height: 20),
          Text(
            'Swipe left to chat',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
