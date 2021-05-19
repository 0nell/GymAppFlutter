import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buttonList(),
    );
  }

  Widget _buttonList() {
    final List<String> _entries = <String>["Programmes", "Workouts", "Exercises"];
    final List<String> _routes = <String>["programmes", "workouts", "exercises"];

    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: _entries.length,
      itemBuilder: (context, int index) {
        return FractionallySizedBox(
          widthFactor: .66,
          child: RaisedButton(
            child: Center(child: Text("${_entries[index]}")),
            elevation: 6,
            focusElevation: 12,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, "/${_routes[index]}");
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
