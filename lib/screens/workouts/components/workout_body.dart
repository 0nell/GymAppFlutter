import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/blocs/database_bloc.dart';
import 'package:gymapp/persistence/hive/programme_model.dart';
import 'package:gymapp/theme/style.dart';
import 'package:hive/hive.dart';

class WorkoutBody extends StatefulWidget {
  @override
  _WorkoutBodyState createState() => _WorkoutBodyState();
}

class _WorkoutBodyState extends State<WorkoutBody> {
  DatabaseBloc _databaseBloc;
  Box<Workout> _workoutBox;

  @override
  void initState() {
    super.initState();
    //Bloc Init
    _databaseBloc = BlocProvider.of<DatabaseBloc>(context);
    _workoutBox = _databaseBloc.wBox;
  }


  //Test
  addTestWorkouts(){
    var w1 = Workout()
      ..title = "Workout 1"
      ..categories = ["Legs", "Back"];

    _workoutBox.add(w1);
    var w2 = Workout()
      ..title = "Workout 2"
      ..categories = ["Arms", "Back"];

    _workoutBox.add(w2);
    var w3 = Workout()
      ..title = "Workout 3"
      ..categories = ["Chest"];

    _workoutBox.add(w3);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(builder: (context, state) {
      return _workoutList();
    });
  }

  Widget _workoutList() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Dismissible(
          key: ObjectKey(_workoutBox.getAt(index)),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.fitness_center),
                  title: Text("${_workoutBox.getAt(index).title}"),
                  subtitle:
                      Text("${_workoutBox.getAt(index).categories.toString()}"),
                ),
                ButtonBar(
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Text("Edit"),
                      textColor: appTheme().primaryColorLight,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text("Start"),
                      textColor: appTheme().primaryColorLight,
                    ),
                  ],
                )
              ],
            ),
          ),
          onDismissed: (direction) {
            var entry = _workoutBox.getAt(index);
            _databaseBloc.add(new DeleteWorkout(index));

            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Workout deleted"),
              action: SnackBarAction(
                  label: "UNDO",
                  onPressed: () {
                    _databaseBloc.add(new AddWorkout(entry));
                  }),
            ));
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: _workoutBox.length,
    );
  }
}
