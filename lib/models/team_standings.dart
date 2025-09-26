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
      limit: int.tryParse(json['limit']) ?? 0,
      offset: int.tryParse(json['offset']) ?? 0,
      total: int.tryParse(json['total']) ?? 0,
      standing: TeamStandingsTable.fromJson(json['StandingsTable'] as Map<String, dynamic>)
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
    final List<dynamic> lists = json['StandingsLists'];
    final Map<String, dynamic> teamStandings = lists.first;
  //   final test = teamStandings['ConstructorStandings'] as List<dynamic>;
  //   final List<String> t = test.map((e) => 
  //   print(e);
  //   String('')
  // )
  // .toList();
    List<TeamStanding> teams = (teamStandings['ConstructorStandings'] as List<dynamic>)
      .map(
        (e) {
          print(e);
          return TeamStanding.fromJson(e as Map<String, dynamic>);
        }
      )
      .toList();
      return TeamStandingsTable(
        season: json['season'],
        round: json['round'],
        standingList: teams
        );
    }
  }

class TeamStanding {
  final String position;
  final String positionText;
  final String points;
  final Team teams;

  TeamStanding ({
    required this.position,
    required this.positionText,
    required this.points,
    required this.teams,
  });

  factory TeamStanding.fromJson(Map<String, dynamic> json) {
    return TeamStanding(
      position: json['position'],
      positionText: json['positionText'],
      points: json['points'],
      teams: Team.fromJson (json['Constructor'] as Map<String, dynamic>),
    );
  }
}