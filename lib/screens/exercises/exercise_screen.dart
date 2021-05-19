import 'package:flutter/material.dart';
import 'components/appbar.dart';
import 'components/category_body.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: categoryHeader(context),
      body: CategoryList(),
    );
  }
}
