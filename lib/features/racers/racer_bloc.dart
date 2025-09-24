import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_ranking/features/racers/racer_event.dart';
import 'package:formula1_ranking/features/racers/racer_state.dart';
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
      final data = await respository.getDrivers('2025');
      if (data.isNotEmpty) {
        print(data);
        emit(RacerSuccess(data));
      } else {
        emit(RacerFailure());
      }
    } catch (e) {
      emit(RacerFailure());
    }
  }
}