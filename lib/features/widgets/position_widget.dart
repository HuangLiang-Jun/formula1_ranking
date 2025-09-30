import 'package:flutter/material.dart';

class PositionWidget extends StatelessWidget {
  final String position;
  PositionWidget({
    super.key,
    required this.position
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: Text(
        '#$position',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      )
    );
  }
}