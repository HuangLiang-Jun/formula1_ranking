import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_ranking/features/racers/racer_event.dart';
import 'package:formula1_ranking/features/racers/racer_state.dart';
import 'package:formula1_ranking/models/driver_standings.dart';
import 'package:formula1_ranking/repository/app_data.dart';
import 'package:formula1_ranking/repository/f1_repository.dart';

class RacerBloc extends Bloc<RacerEvent, RacerState> {
  final F1Repository respository;
  RacerBloc({ required this.respository }) : super(RacerInitial()) {
    on<GetDriversData>(_onGetDriversData);
  }

  Future<void> _onGetDriversData(
    GetDriversData event,
    Emitter<RacerState> emit,
  ) async {
  emit(RacerLoading());
    try {
      final year = DateTime.now().year.toString();
      final jsonStr = await respository.getDrivers(year);
      if (jsonStr.isNotEmpty) {
        // print(data);
        final Map<String, dynamic> jsonData = jsonDecode(jsonStr);
        final DriverStandingsMRData driver = DriverStandingsMRData.fromJson(
          jsonData['MRData']
        );
        await mergeDriverDetail(driver.standing.standingList);
        emit(RacerSuccess(driver));
      } else {
        emit(RacerFailure());
      }
    } catch (e) {
      emit(RacerFailure());
    }
  }

  Future<void> mergeDriverDetail(List<DriverStanding> standings) async {
    for (var s in standings) {
      final number = int.parse(s.driver.number);
      s.driver.avator = AppData().getDriverAvatar(s.driver.fullName, number);
      s.team.teamColor = AppData().getDriverTeamColor(s.driver.fullName, number);
    }
  }
}