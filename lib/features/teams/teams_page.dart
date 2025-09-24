import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_ranking/features/teams/teams_bloc.dart';
import 'package:formula1_ranking/features/teams/teams_state.dart';

class TeamsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamsBloc, TeamsState>(
      builder: (context, state) {
        if (state is TeamsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TeamsSuccess) {
          return Text(state.groups);
        }
        return Center(child: Text('Failure'),);
      }
    );
  }
}