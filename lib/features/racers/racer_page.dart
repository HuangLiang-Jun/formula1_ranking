import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_ranking/features/racers/racer_bloc.dart';
import 'package:formula1_ranking/features/racers/racer_event.dart';
import 'package:formula1_ranking/features/racers/racer_state.dart';
import 'package:formula1_ranking/features/racers/widgets/driver_standing_item_widget.dart';

class RacerPage extends StatefulWidget {
  const RacerPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RacerPageState();
  }
}

class _RacerPageState extends State<RacerPage> {
  @override
  void initState() {
    super.initState();
    context.read<RacerBloc>().add(GetDriversData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RacerBloc, RacerState>(
      builder: (context, state) {
        if (state is RacerLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is RacerSuccess) {
          return Center(
            child: ListView.builder(
              itemCount: state.drivers.standing.standingList.length,
              itemBuilder:(context, index) {
                return DriverStandingWidget(standing: state.drivers.standing.standingList[index]);
              },
              padding: EdgeInsets.only(bottom: 20),
            )
          );
        }
        return Center(
          child: Text(
            '無法載入資料，請檢查網路連接。',
            style: TextStyle(color: Colors.white),
          ),
        );
      }
    );
  }
}