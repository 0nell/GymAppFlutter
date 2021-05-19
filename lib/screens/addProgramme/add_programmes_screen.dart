import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/blocs/add_programme_bloc.dart';
import 'package:gymapp/screens/addProgramme/components/appbar.dart';
import 'package:gymapp/screens/addProgramme/components/add_programme_body.dart';

class AddProgrammesScreen extends StatefulWidget {
  @override
  _AddProgrammesScreenState createState() => _AddProgrammesScreenState();
}

class _AddProgrammesScreenState extends State<AddProgrammesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddProgrammeBloc(),
      child: Scaffold(
        appBar: header(),
        body: AddProgrammeBody(),
      ),
    );
  }
}
