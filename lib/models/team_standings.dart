import 'package:formula1_ranking/models/team.dart';

class TeamStandingsMRData {
  final int limit;
  final int offset;
  final int total;
  final TeamStandingsTable standing;

  TeamStandingsMRData({
    required this.limit,
    required this.offset,
    required this.total,
    required this.standing
  });

  factory TeamStandingsMRData.fromJson(
      Map<String, dynamic> json
    ) {
    return TeamStandingsMRData(
      limit: int.tryParse(json['limit']?.toString() ?? '0') ?? 0,
      offset: int.tryParse(json['offset']?.toString() ?? '0') ?? 0,
      total: int.tryParse(json['total']?.toString() ?? '0') ?? 0,
      standing: TeamStandingsTable.fromJson(json['StandingsTable'] as Map<String, dynamic>? ?? {})
    );
  }
}

class TeamStandingsTable {
  final String season;
  final String round;
  final List<TeamStanding> standingList;

  TeamStandingsTable({
    required this.season,
    required this.round,
    required this.standingList
  });

  factory TeamStandingsTable.fromJson(
    Map<String, dynamic> json,
  ) {
    final standingLists = json['StandingsLists'] as List<dynamic>?;
    if (standingLists == null || standingLists.isEmpty) {
      return TeamStandingsTable(
        season: json['season'] ?? '',
        round: json['round'] ?? '',
        standingList: []
      );
    }
    final Map<String, dynamic> teamStandings = standingLists.first;
    List<TeamStanding> teams = (teamStandings['ConstructorStandings'] as List<dynamic>? ?? [])
      .map(
        (e) {
          return TeamStanding.fromJson(e as Map<String, dynamic>);
        }
      )
      .toList();
      return TeamStandingsTable(
        season: json['season'] ?? '',
        round: json['round'] ?? '',
        standingList: teams
        );
    }
  }

class TeamStanding {
  final String position;
  final String positionText;
  final String points;
  final Team team;

  TeamStanding ({
    required this.position,
    required this.positionText,
    required this.points,
    required this.team,
  });

  factory TeamStanding.fromJson(Map<String, dynamic> json) {
    return TeamStanding(
      position: json['position'] ?? '-',
      positionText: json['positionText'],
      points: json['points'],
      team: Team.fromJson (json['Constructor'] as Map<String, dynamic>),
    );
  }
}