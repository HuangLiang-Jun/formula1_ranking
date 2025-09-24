import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_ranking/features/teams/teams_bloc.dart';
import 'package:formula1_ranking/features/teams/teams_event.dart';
import 'package:formula1_ranking/features/teams/teams_page.dart';
import 'package:formula1_ranking/features/racers/racer_bloc.dart';
import 'package:formula1_ranking/features/racers/racer_event.dart';
import 'package:formula1_ranking/features/racers/racer_page.dart';
import 'package:formula1_ranking/repository/f1_repository.dart';

class TabPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('F1 Ranking'),
          bottom: TabBar(
            tabs: [
              Tab(text: '賽車手'),
              Tab(text: '車隊'),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              create: (_) => RacerBloc(
                respository: context.read<F1Repository>(),
              )..add(GetDriversData()),
              child: RacerPage(),
            ),
            BlocProvider(
              create: (_) => TeamsBloc(
                respository: context.read<F1Repository>(),
              )..add(GetTeamsData()),
              child: TeamsPage(),
            )
          ]
        ),
      )
    );
  }
}