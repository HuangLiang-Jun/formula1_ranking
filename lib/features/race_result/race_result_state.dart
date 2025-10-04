abstract class RaceResultState {}

class RaceResultInitial extends RaceResultState {}

class RaceResultLoading extends RaceResultState {}

class RaceResultSuccess extends RaceResultState {
  String message;
  RaceResultSuccess(this.message);
}

class RaceResultFailure extends RaceResultState {}