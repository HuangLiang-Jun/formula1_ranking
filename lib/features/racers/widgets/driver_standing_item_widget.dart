
import 'package:flutter/material.dart';
import 'package:formula1_ranking/features/widgets/position_widget.dart';
import 'package:formula1_ranking/features/widgets/pts_widget.dart';
import 'package:formula1_ranking/models/driver_standings.dart';

class DriverStandingWidget extends StatelessWidget {
  final DriverStanding standing;
  const DriverStandingWidget({super.key, required this.standing });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF0F172A), // 深色背景
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // 名次
            PositionWidget(
              position: standing.positionText
            ),
            const SizedBox(width: 12),

            // 頭像
            CircleAvatar(
              backgroundColor: Colors.blue.shade700,
              child: Text(
                standing.driver.code, // e.g. "MV"
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 12),

            // Driver name + Team
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    standing.driver.lastName, // e.g. Max Verstappen
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'constructor.name', // e.g. Red Bull Racing
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),

            // 分數 Badge
            PTSWidget(points: standing.points),
          ],
        ),
      ),
    );
  }
}