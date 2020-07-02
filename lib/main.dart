import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/routes.dart';
import 'package:gymapp/theme/style.dart';

void main() {
  runApp(GymApp());
}

class GymApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {},
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "GymApp",
          theme: appTheme(),
          initialRoute: "programmes",
          routes: routes,
        ));
  }
}
