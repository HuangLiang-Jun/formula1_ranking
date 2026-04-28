import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_ranking/features/teams/teams_event.dart';
import 'package:formula1_ranking/features/teams/teams_state.dart';
import 'package:formula1_ranking/models/team_standings.dart';
import 'package:formula1_ranking/repository/app_data.dart';
import 'package:formula1_ranking/repository/f1_repository.dart';

class TeamsBloc extends Bloc<TeamsEvent, TeamsState> {
  final F1Repository respository;
  TeamsBloc({ required this.respository }) : super(GroupInitial()) {
    on<GetTeamsData>(_onGetTeamsData);
  }

  Future<void> _onGetTeamsData(
    GetTeamsData event,
    Emitter<TeamsState> emit,
  ) async {
    emit(TeamsLoading());
    try {
      final year = DateTime.now().year.toString();
      final jsonStr = await respository.getTeams(year);
      if (jsonStr.isNotEmpty) {
        final Map<String, dynamic> jsonData = jsonDecode(jsonStr);
        final TeamStandingsMRData teams = TeamStandingsMRData.fromJson(
          jsonData['MRData']
        );
        await mergerTeamColour(teams.standing.standingList);
        emit(TeamsSuccess(teams));
      } else {
        emit(TeamsFailure('json is empty!'));
      }
    } catch (e) {
      print("General error in Team block: $e");
      emit(TeamsFailure('error message'));
    }
  }

  Future<void> mergerTeamColour(List<TeamStanding> standings) async {
    for (var s in standings) {
      s.team.teamColor = AppData().getTeamColor(s.team.name);
    }
  }
}