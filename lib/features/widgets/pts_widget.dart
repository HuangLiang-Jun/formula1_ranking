import 'package:flutter/material.dart';

class PTSWidget extends StatelessWidget {
  final String points;

  const PTSWidget({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            points,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Text(
            "PTS",
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}