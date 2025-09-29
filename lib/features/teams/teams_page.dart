import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_ranking/features/teams/teams_bloc.dart';
import 'package:formula1_ranking/features/teams/teams_event.dart';
import 'package:formula1_ranking/features/teams/teams_state.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() {
    return _TeamsPageState();
  }
}


class _TeamsPageState extends State<TeamsPage> {

  @override
  void initState() {
    super.initState();
    context.read<TeamsBloc>().add(GetTeamsData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamsBloc, TeamsState>(
      builder: (context, state) {
        if (state is TeamsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TeamsSuccess) {
          return Center(
            child: ListView.builder(
              itemCount: state.teams.standing.standingList.length,
              itemBuilder:(context, index) {
                return ListTile(
                  leading: Icon(Icons.event_seat),
                  title: Text(state.teams.standing.standingList[index].teams.name),
                );
              }
            )
          );
        }
        return Center(child: Text('Failure'),);
      }
    );
  }
}