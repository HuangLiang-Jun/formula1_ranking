import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:formula1_ranking/Tab/tab_bar_screen.dart';
import 'package:formula1_ranking/features/race_result/race_result_bloc.dart';
import 'package:formula1_ranking/features/teams/teams_bloc.dart';
import 'package:formula1_ranking/features/racers/racer_bloc.dart';
import 'package:formula1_ranking/repository/app_data.dart';
import 'package:formula1_ranking/repository/f1_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: "assets/.env");
    await AppData().init(null);
  } catch (e) {
    debugPrint("Initialization error: $e");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => F1Repository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RacerBloc>(
            create:(context) =>
              RacerBloc(
                respository: context.read<F1Repository>()
              ),
          ),
          BlocProvider<TeamsBloc>(
            create:(context) =>
              TeamsBloc(
                respository: context.read<F1Repository>()
              ),
          ),
          BlocProvider<RaceResultBloc>(
            create:(context) =>
              RaceResultBloc(
                respository: context.read<F1Repository>()
              ),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            splashFactory: NoSplash.splashFactory
          ),
          home: const TabBarScreen(),
        )
      )
    );
  }
}