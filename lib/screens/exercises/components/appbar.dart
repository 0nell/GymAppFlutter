import 'package:flutter/material.dart';


AppBar categoryHeader(BuildContext context){
  return AppBar(
  title: Text("Exercises"),
  leading: IconButton(icon: Icon(Icons.clear), onPressed:() => Navigator.pop(context)),
  actions: [
    IconButton(icon: Icon(Icons.edit), onPressed: () {}
    ),
  ],
);
}