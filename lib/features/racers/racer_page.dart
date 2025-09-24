import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_ranking/features/racers/racer_bloc.dart';
import 'package:formula1_ranking/features/racers/racer_state.dart';

class RacerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<RacerBloc, RacerState>(
      builder: (context, state) {
        if (state is RacerLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is RacerSuccess) {
          return Text(state.drivers);
        }
        return Center(child: Text('Failure'),);
      }
    );
  }
}