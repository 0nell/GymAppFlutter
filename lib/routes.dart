import 'package:flutter/widgets.dart';
import 'package:gymapp/screens/home/homeScreen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
};
