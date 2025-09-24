import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_ranking/features/teams/teams_event.dart';
import 'package:formula1_ranking/features/teams/teams_state.dart';
import 'package:formula1_ranking/repository/f1_repository.dart';

class TeamsBloc extends Bloc<TeamsEvent, TeamsState> {
  final F1Repository respository;
  TeamsBloc({ required this.respository }) : super(GroupInitial()) {
    on<GetTeamsData>(_onGetGroupsData);
  }

  Future<void> _onGetGroupsData(
    GetTeamsData event,
    Emitter<TeamsState> emit,
  ) async {
    emit(TeamsLoading());
    try {
      final data = await respository.getTeams('2025');
      if (data.isNotEmpty) {
        print(data);
        emit(TeamsSuccess(data));
      } else {
        emit(TeamsFailure());
      }
    } catch (e) {
      emit(TeamsFailure());
    }
  }
}