import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_ranking/features/racers/racer_event.dart';
import 'package:formula1_ranking/features/racers/racer_state.dart';
import 'package:formula1_ranking/models/driver_standings.dart';
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
      final jsonStr = await respository.getDrivers('2025');
      if (jsonStr.isNotEmpty) {
        // print(data);
        final Map<String, dynamic> jsonData = jsonDecode(jsonStr);
        final DriverStandingsMRData driver = DriverStandingsMRData.fromJson(
          jsonData['MRData']
        );
        emit(RacerSuccess(driver));
      } else {
        emit(RacerFailure());
      }
    } catch (e) {
      print(e);
      emit(RacerFailure());
    }
  }
}