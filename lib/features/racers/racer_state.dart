abstract class RacerState {}

class RacerInitial extends RacerState {}

class RacerLoading extends RacerState {}

class RacerSuccess extends RacerState {
  final String drivers;
  RacerSuccess(this.drivers);
}

class RacerFailure extends RacerState {}