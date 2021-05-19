import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/blocs/add_programme_bloc.dart';
import 'package:gymapp/blocs/database_bloc.dart';
import 'package:gymapp/persistence/hive/programme_model.dart';
import 'package:gymapp/theme/style.dart';


class AddProgrammeBody extends StatefulWidget {
  @override
  _AddProgrammeBodyState createState() => _AddProgrammeBodyState();
}

class _AddProgrammeBodyState extends State<AddProgrammeBody> with TickerProviderStateMixin{
  AddProgrammeBloc _addProgrammeBloc;
  // ignore: close_sinks
  DatabaseBloc _databaseBloc;
  Programme _newProgramme;
  TabController  _cardController;
  final _titleController = TextEditingController();
  List<Workout> workouts = List<Workout>();


  @override
  void dispose() {
    _cardController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();

    //Bloc Init
    _databaseBloc = BlocProvider.of<DatabaseBloc>(context);
    _addProgrammeBloc = BlocProvider.of<AddProgrammeBloc>(context);

    //Workout Tabs Init

    _newProgramme = Programme();
    if(_newProgramme.workouts != null){
      workouts.addAll(_newProgramme.workouts);
    }
    workouts.add(new Workout());

    debugPrint("${workouts.length}");
    _cardController = new TabController(vsync: this, length: workouts.length);
  }

  @override
  Widget build(BuildContext context) {
    var pBox = _databaseBloc.pBox;
    return BlocBuilder<AddProgrammeBloc, AddProgrammeState>(
      builder: (context, state) => ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _titleController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Programme Title"
                    ),
                  ),
                ),
              _buildDurationButton(),
              SizedBox(
                  height: 400,
                  width: 300,
                  child: _buildWorkoutTabView()
              ),
                _buildButtonBar(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                      child: Text("Save"),
                      onPressed: (){
                        _newProgramme.title = _titleController.text;
                        _newProgramme.duration = _dropDownValue;
                        pBox.add(_newProgramme);
                        //TODO use .save
                      }
                  ),
                )
            ],
          ),
        ]
        ),
      );
  }

  Widget _buildButtonBar(){
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          child: Text("Add Day"),
          onPressed: () {
            workouts.add(new Workout());
            _cardController = new TabController(length: workouts.length, vsync: this);
            _addProgrammeBloc.add(AddWorkoutEvent());
          },
        ),
        RaisedButton(
          child: Text("Remove Day"),
          onPressed: () {
            if(workouts.length> 0) {
              workouts.removeAt(_cardController.index);
              _cardController = new TabController(length: workouts.length, vsync: this);
              _addProgrammeBloc.add(RemoveWorkoutEvent());
            }

          },
        ),
      ],
    );
  }

  String _dropDownValue = "Indefinite";
  DropdownButton<String> _buildDurationButton() {

    List<String> _durations = <String>["Indefinite"];
    for (var i = 0; i < 20; i ++) {
      _durations.add("${i + 1} Cycles");
    }

    return DropdownButton<String>(
      value: _dropDownValue,
      hint: Text("Programme Duration"),
      style: TextStyle(color: appTheme().primaryColorLight),
      underline: Container(
        height: 2,
        color: appTheme().primaryColorLight,
      ),
      onChanged: (String newValue) {
          _dropDownValue = newValue;
          _addProgrammeBloc.add(SetDurationEvent());
      },

      items:
      _durations.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }


  Widget _buildWorkoutTabView() {
    return TabBarView(
      controller: _cardController,
      children:
        workouts.isEmpty ? <Widget>[]
        : workouts.map((workout) {
          return _workoutsTab(workout);
        },

    ).toList(),
    );

  }

  Widget _workoutsTab(Workout workout){
    final workoutController = TextEditingController();
    return Card(
        child: Container(
          height: 450,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: TextField(
                 onChanged: (newValue){
                 },
                  controller: workoutController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Workout Name",
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, "/exercises");
                  }
              ),
              Text("Add Exercise"),
            ],
          ),
        ),
      );

  }
}
