import 'package:flutter/material.dart';

AppBar header() => AppBar(
  title: Text("Add Programme"),
  backgroundColor: Colors.black,
  leading: IconButton(
    icon: Icon(Icons.clear),
    onPressed: () { },
  ),
  actions: [
    IconButton(
      icon: Icon(Icons.settings),
      onPressed: () { },
    )
  ],
);