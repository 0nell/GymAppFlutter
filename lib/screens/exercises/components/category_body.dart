import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/blocs/database_bloc.dart';
import 'package:gymapp/persistence/moor_database.dart';
import 'package:gymapp/screens/exercises/components/appbar.dart';

//TODO CHANGE LOADING SCREEN

class ExerciseList extends StatefulWidget {
  final Category category;

  const ExerciseList({Key key, this.category}) : super(key: key);

  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  DatabaseBloc databaseBloc;

  @override
  void initState() {
    super.initState();
    databaseBloc = BlocProvider.of<DatabaseBloc>(context);
  }

  getExercises(Category c) async {
    return databaseBloc.getExerciseByCategory(c);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: categoryHeader(context),
        body:
            BlocBuilder<DatabaseBloc, DatabaseState>(builder: (context, state) {
          return FutureBuilder(
              future: getExercises(widget.category),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Text(snapshot.data[index].title),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ExercisePage(
                                exercise: snapshot.data[index],)));
                          });
                    },
                    itemCount: snapshot.data.length,
                  );
                } else {
                  return Text("Load");
                }
              });
        }));
  }
}

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  DatabaseBloc databaseBloc;

  @override
  void initState() {
    super.initState();
    databaseBloc = BlocProvider.of<DatabaseBloc>(context);
  }

  getCategories() async {
    debugPrint('Step 1, compile list');
    return databaseBloc.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(builder: (context, state) {
      return FutureBuilder(
        future: getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(snapshot.data[index].title),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExerciseList(
                                  category: snapshot.data[index])));
                    });
              },
              itemCount: snapshot.data.length,
            );
          } else {
            return Text("LOAD :)");
          }
        },
      );
    });
  }
}

class ExercisePage extends StatefulWidget {
  final Exercise exercise;

  const ExercisePage({Key key, this.exercise}) : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  // ignore: close_sinks
  DatabaseBloc databaseBloc;

  @override
  void initState() {
    super.initState();
    databaseBloc = BlocProvider.of<DatabaseBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.exercise.title),
    );
  }
}

