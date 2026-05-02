import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const TextSection({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// BIG TEXT (Title)
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F2A33), // dark bluish like your UI
            ),
          ),

          const SizedBox(height: 8),

          /// SMALL TEXT (Subtitle)
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}