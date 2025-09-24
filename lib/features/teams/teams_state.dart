abstract class TeamsState {}

class GroupInitial extends TeamsState {}

class TeamsLoading extends TeamsState {}

class TeamsSuccess extends TeamsState {
  final String groups;
  TeamsSuccess(this.groups);
}

class TeamsFailure extends TeamsState {}