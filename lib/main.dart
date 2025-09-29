import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:formula1_ranking/Tab/tab_bar_screen.dart';
import 'package:formula1_ranking/features/teams/teams_bloc.dart';
import 'package:formula1_ranking/features/racers/racer_bloc.dart';
import 'package:formula1_ranking/repository/f1_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  runApp(MyApp());
}
// void main() {
//   runApp(const MyApp());
// }

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
        ],
        child: MaterialApp(
          home: const TabBarScreen(),
        )
      )
    );
  }
}