import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/screens/workouts/components/workout_appbar.dart';
import 'package:gymapp/screens/workouts/components/workout_body.dart';

class WorkoutScreen extends StatefulWidget {
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {  },
      child: Scaffold(
        appBar: workoutHeader(context),
        body: WorkoutBody(),
        floatingActionButton: FloatingActionButton(
         onPressed: (){},
          child: Icon(Icons.add),
          tooltip: "Add new workout",
        ),
      ),
    );
  }
}
