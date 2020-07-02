import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/screens/programmes/components/appbar.dart';
import 'package:gymapp/screens/programmes/components/body.dart';

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
        appBar: header(),
        body: Body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: "Add Programme",
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
