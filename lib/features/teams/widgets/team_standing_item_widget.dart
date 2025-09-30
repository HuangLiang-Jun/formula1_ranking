
import 'package:flutter/material.dart';
import 'package:formula1_ranking/features/widgets/position_widget.dart';
import 'package:formula1_ranking/features/widgets/pts_widget.dart';
import 'package:formula1_ranking/models/team_standings.dart';

class TeamStandingWidget extends StatelessWidget {
  final TeamStanding standing;
  const TeamStandingWidget({super.key, required this.standing });

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
            // Psition
            PositionWidget(
              position: standing.positionText
            ),
            const SizedBox(width: 12),
            // Team
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    standing.team.name, // e.g. Max Verstappen
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    width: 20.0, // Controls the size of the dot
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Color(int.parse('0xFF${standing.team.teamColor}')), // The color of the dot
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
            ),

            // Ponits
            PTSWidget(
              points: standing.points
            ),
          ],
        ),
      ),
    );
  }
}