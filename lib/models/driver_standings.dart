import 'package:formula1_ranking/models/driver.dart';
import 'package:formula1_ranking/models/team.dart';

class DriverStandingsMRData {
  final int limit;
  final int offset;
  final int total;
  final DriverStandingsTable standing;

  DriverStandingsMRData({
    required this.limit,
    required this.offset,
    required this.total,
    required this.standing
  });

  factory DriverStandingsMRData.fromJson(
      Map<String, dynamic> json
    ) {
    return DriverStandingsMRData(
      limit: int.tryParse(json['limit']?.toString() ?? '0') ?? 0,
      offset: int.tryParse(json['offset']?.toString() ?? '0') ?? 0,
      total: int.tryParse(json['total']?.toString() ?? '0') ?? 0,
      standing: DriverStandingsTable.fromJson(json['StandingsTable'] as Map<String, dynamic>? ?? {})
    );
  }
}

class DriverStandingsTable {
  final String season;
  final String round;
  final List<DriverStanding> standingList;

  DriverStandingsTable({
    required this.season,
    required this.round,
    required this.standingList
  });

  factory DriverStandingsTable.fromJson(
    Map<String, dynamic> json,
  ) {
    final standingLists = json['StandingsLists'] as List<dynamic>?;
    if (standingLists == null || standingLists.isEmpty) {
      return DriverStandingsTable(
        season: json['season'] ?? '',
        round: json['round'] ?? '',
        standingList: []
      );
    }
    final Map<String, dynamic> lists = standingLists.first;
    List<DriverStanding> teams = (lists['DriverStandings'] as List<dynamic>? ?? [])
      .map((e) => DriverStanding.fromJson(e as Map<String, dynamic>))
      .toList();
      return DriverStandingsTable(
        season: json['season'] ?? '',
        round: json['round'] ?? '',
        standingList: teams
        );
    }
  }


class DriverStanding {
  final String position;
  final String positionText;
  final String points;
  final Driver driver;
  final Team team;

  DriverStanding ({
    required this.position,
    required this.positionText,
    required this.points,
    required this.driver,
    required this.team
  });

  factory DriverStanding.fromJson(Map<String, dynamic> json) {
    final teams = json['Constructors'] as List<dynamic>;
    Team team;
    if (teams.isEmpty) {
      team = Team(id: '', name: '');
    } else {
      team = Team.fromJson(teams.first as Map<String, dynamic>);
    }
    return DriverStanding(
      position: json['position'] ?? "-",
      positionText: json['positionText'],
      points: json['points'],
      driver: Driver.fromJson (json['Driver'] as Map<String, dynamic>),
      team: team
    );
  }
}