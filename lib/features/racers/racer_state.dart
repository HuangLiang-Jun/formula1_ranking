import 'package:formula1_ranking/models/driver_standings.dart';

abstract class RacerState {}

class RacerInitial extends RacerState {}

class RacerLoading extends RacerState {}

class RacerSuccess extends RacerState {
  final DriverStandingsMRData drivers;
  RacerSuccess(this.drivers);
}

class RacerFailure extends RacerState {}