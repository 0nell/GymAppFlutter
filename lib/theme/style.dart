import 'package:flutter/material.dart';

ThemeData appTheme() => ThemeData(
    primaryColor: Color.fromRGBO(4, 38, 207, 1),
    primaryColorDark: Color.fromRGBO(0, 0, 156, 1),
    primaryColorLight: Color.fromRGBO(99, 82, 255, 1),
    accentColor: Color.fromRGBO(225, 225, 225, 1),
    buttonColor: Color.fromRGBO(99, 82, 255, 1),
    dividerColor: Colors.white,
    backgroundColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(99, 82, 255, 1),
      foregroundColor: Color.fromRGBO(225, 225, 225, 1),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ));
