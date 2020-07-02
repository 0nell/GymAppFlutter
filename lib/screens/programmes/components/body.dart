import 'package:flutter/material.dart';
import 'package:gymapp/theme/style.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _cardList(),
    );
  }

  Widget _cardList() {
    final List<String> _titles = <String>["SBD", "MadCow", "Tim's Tots"];
    final List<String> _durations = <String>[
      "12 Weeks",
      "5 Weeks",
      "Indefinite"
    ];

    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("${_titles[index]}"),
                subtitle: Text("${_durations[index]}"),
              ),
              ButtonBar(
                children: [
                  FlatButton(
                    child: Text("Edit"),
                    textColor: appTheme().primaryColorLight,
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text("Start"),
                    textColor: appTheme().primaryColorLight,
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: _titles.length,
    );
  }
}
