import 'package:flutter/material.dart';

AppBar workoutHeader(BuildContext context) => AppBar(
  title: Text("Workouts"),
  leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
    Navigator.pop(context);
  }),
  actions: [
    IconButton(
        icon: Icon(Icons.calendar_today),
        tooltip: "Open Workout Calender",
        onPressed: () {}),
    IconButton(
        icon: Icon(Icons.more_vert),
        tooltip: "More Options",
        onPressed: () {}),
  ],
);
