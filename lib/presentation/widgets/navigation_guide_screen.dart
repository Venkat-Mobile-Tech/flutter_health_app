import 'package:flutter/material.dart';

import '../enums/screen_type.dart';

class NavigationGuideScreen extends StatelessWidget {
  final ScreenType type;

  const NavigationGuideScreen({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Icon(
            type.icon == 'arrow_forward'
                ? Icons.arrow_forward
                : Icons.arrow_back,
            color: Colors.white,
            size: 48,
          ),
          const SizedBox(height: 20),
          Text(
            type.message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
