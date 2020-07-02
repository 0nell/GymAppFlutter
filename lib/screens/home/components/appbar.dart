import 'package:flutter/material.dart';

AppBar headerHome() => AppBar(
      title: Text("GymApp"),
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
