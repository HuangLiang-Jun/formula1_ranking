import 'package:formula1_ranking/models/team_standings.dart';

abstract class TeamsState {}

class GroupInitial extends TeamsState {}

class TeamsLoading extends TeamsState {}

class TeamsSuccess extends TeamsState {
  final TeamStandingsMRData teams;
  TeamsSuccess(this.teams);
}

class TeamsFailure extends TeamsState {
  final String message;
  TeamsFailure(this.message);
}