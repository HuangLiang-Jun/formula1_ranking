import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_ranking/features/race_result/race_result_bloc.dart';

class RaceResultPage extends StatefulWidget {
  const RaceResultPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RaceResultPageState();
  }
}

class _RaceResultPageState extends State<RaceResultPage> {
  @override
  void initState() {
    super.initState();
    context.read<RaceResultBloc>();//.add(GetDriversData());
  }

  @override
  Widget build(BuildContext context) {
    return Text('RaceResultPage');
    // return BlocBuilder<RaceResultBloc, RaceResultState>(
    //   builder: (context, state) {
    //     if (state is RacerLoading) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (state is RacerSuccess) {
    //       return Center(
    //         child: ListView.builder(
    //           itemCount: state.drivers.standing.standingList.length,
    //           itemBuilder:(context, index) {
    //             return DriverStandingWidget(standing: state.drivers.standing.standingList[index]);
    //           },
    //           padding: EdgeInsets.only(bottom: 20),
    //         )
    //       );
    //     }
    //     return Center(child: Text('Failure'),);
    //   }
    // );
  }
}