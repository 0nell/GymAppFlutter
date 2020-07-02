import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/screens/home/components/Body.dart';
import 'package:gymapp/screens/home/components/appbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {},
      child: Scaffold(
        appBar: headerHome(),
        body: Body(),
      ),
    );
  }
}
