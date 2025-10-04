import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_ranking/features/race_result/race_result_event.dart';
import 'package:formula1_ranking/features/race_result/race_result_state.dart';
import 'package:formula1_ranking/models/driver_standings.dart';
import 'package:formula1_ranking/repository/app_data.dart';
import 'package:formula1_ranking/repository/f1_repository.dart';

class RaceResultBloc extends Bloc<RaceResultEvent, RaceResultState> {
  final F1Repository respository;
  RaceResultBloc({ required this.respository }) : super(RaceResultInitial()) {
    on<GetRacesResult>(_onGetRacesResultData);
  }

  Future<void> _onGetRacesResultData(
    GetRacesResult event,
    Emitter<RaceResultState> emit,
  ) async {
  emit(RaceResultLoading());
    try {
      final year = DateTime.now().year.toString();
      final jsonStr = await respository.getRacesResult(year);
      if (jsonStr.isNotEmpty) {
        // print(data);
        // final Map<String, dynamic> jsonData = jsonDecode(jsonStr);
        // final DriverStandingsMRData driver = DriverStandingsMRData.fromJson(
        //   jsonData['MRData']
        // );
        // await mergeDriverDetail(driver.standing.standingList);
        emit(RaceResultSuccess(''));
      } else {
        emit(RaceResultFailure());
      }
    } catch (e) {
      emit(RaceResultFailure());
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