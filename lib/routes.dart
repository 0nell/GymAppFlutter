import 'package:flutter/widgets.dart';
import 'package:gymapp/screens/addProgramme/add_programmes_screen.dart';
import 'package:gymapp/screens/exercises/exercise_screen.dart';
import 'package:gymapp/screens/home/homeScreen.dart';
import 'package:gymapp/screens/programmes/programmes_screen.dart';
import 'package:gymapp/screens/workouts/workout_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/programmes": (BuildContext context) => ProgrammesScreen(),
  "/addProgrammes": (BuildContext context) => AddProgrammesScreen(),
  "/exercises": (context) => ExerciseScreen(),
  "/workouts": (context) => WorkoutScreen(),
};
