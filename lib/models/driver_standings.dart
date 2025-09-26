import 'package:formula1_ranking/models/driver.dart';

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
      limit: int.tryParse(json['limit']) ?? 0,
      offset: int.tryParse(json['offset']) ?? 0,
      total: int.tryParse(json['total']) ?? 0,
      standing: DriverStandingsTable.fromJson(json['StandingsTable'] as Map<String, dynamic>)
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
    final Map<String, dynamic> lists = json['StandingsLists'].first;
    List<DriverStanding> teams = (lists['DriverStandings'] as List<dynamic>)
      .map((e) => DriverStanding.fromJson(e as Map<String, dynamic>))
      .toList();
      return DriverStandingsTable(
        season: json['season'],
        round: json['round'],
        standingList: teams
        );
    }
  }


class DriverStanding {
  final String position;
  final String positionText;
  final String points;
  final Driver driver;

  DriverStanding ({
    required this.position,
    required this.positionText,
    required this.points,
    required this.driver,
  });

  factory DriverStanding.fromJson(Map<String, dynamic> json) {
    return DriverStanding(
      position: json['position'],
      positionText: json['positionText'],
      points: json['points'],
      driver: Driver.fromJson (json['Driver'] as Map<String, dynamic>),
    );
  }
}