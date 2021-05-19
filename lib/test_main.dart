import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/blocs/database_bloc.dart';
import 'package:gymapp/persistence/hive/programme_model.dart';
import 'package:gymapp/routes.dart';
import 'package:gymapp/theme/style.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const programmeBox = "programmeBox";
const workoutBox = "workoutBox";

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ProgrammeAdapter());
  Hive.registerAdapter(WorkoutAdapter());
  await Hive.openBox<Workout>(workoutBox);
  await Hive.openBox<Programme>(programmeBox);
  runApp(GymApp());
}

class GymApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DatabaseBloc>(
        create: (context) => DatabaseBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "GymApp",
          theme: appTheme(),
          initialRoute: "/",
          routes: routes,
        ));
  }

}
