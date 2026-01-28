
import 'package:flutter/material.dart';
import 'package:formula1_ranking/widgets/position_widget.dart';
import 'package:formula1_ranking/widgets/pts_widget.dart';
import 'package:formula1_ranking/models/driver_standings.dart';

class DriverStandingWidget extends StatelessWidget {
  final DriverStanding standing;
  const DriverStandingWidget({super.key, required this.standing });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF0F172A),
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // position
            PositionWidget(
              position: standing.positionText
            ),
            const SizedBox(width: 12),

            // avatar
            CircleAvatar(
              backgroundColor: Color(int.parse('0xFF${standing.team.teamColor}')),
              child: ClipOval(
                child: Image.network(
                  standing.driver.avator,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Text( // Driver code
                      standing.driver.code,
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Text(
                      standing.driver.code, // e.g. "MV"
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                ),
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
                    standing.team.name, // e.g. Red Bull Racing
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),

            // points
            PTSWidget(points: standing.points),
          ],
        ),
      ),
    );
  }
}