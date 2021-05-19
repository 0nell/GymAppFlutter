import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/screens/programmes/components/appbar.dart';
import 'package:gymapp/screens/programmes/components/programme_body.dart';

class ProgrammesScreen extends StatefulWidget {
  @override
  _ProgrammesScreenState createState() => _ProgrammesScreenState();
}

class _ProgrammesScreenState extends State<ProgrammesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {},
      child: Scaffold(
        appBar: header(context),
        body: ProgrammeBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/addProgrammes");
          },
          tooltip: "Add Programme",
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
