import 'package:flutter/material.dart';

AppBar header(BuildContext context) => AppBar(
      title: Text("Programmes"),
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
