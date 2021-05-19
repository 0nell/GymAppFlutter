import 'package:flutter/material.dart';
import 'package:gymapp/persistence/hive/programme_model.dart';
import 'package:gymapp/test_main.dart';
import 'package:gymapp/theme/style.dart';
import 'package:hive/hive.dart';
//TODO add bloc to handle delete and stuff

class ProgrammeBody extends StatefulWidget {
  @override
  _ProgrammeBodyState createState() => _ProgrammeBodyState();
}

class _ProgrammeBodyState extends State<ProgrammeBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _cardList(),
    );
  }

  Widget _cardList(){
    var pBox = Hive.box<Programme>(programmeBox);
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ObjectKey(pBox.getAt(index)),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text("${pBox.getAt(index).title}"),
                  subtitle: Text("${pBox.getAt(index).duration}"),
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
          ),
          onDismissed: (direction){
            var item = pBox.getAt(index);
            setState(() {
              pBox.deleteAt(index);
            });

            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Programme deleted"),
            action: SnackBarAction(
                label: "UNDO",
                onPressed: (){
                  setState(() {
                    pBox.add(item);
                  });
                }),));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: pBox.length,
    );
  }
}

