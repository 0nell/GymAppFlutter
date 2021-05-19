import 'package:hive/hive.dart';

part 'programme_model.g.dart';

@HiveType(typeId: 1)
class Programme extends HiveObject{
  @HiveField(0)
  String title;

  @HiveField(1)
  List<Workout> workouts;

  @HiveField(2)
  String duration;
}

@HiveType(typeId: 2)
class Workout{
  @HiveField(0)
  String title;
  @HiveField(1)
  List<String> categories;
  @HiveField(2)
  List<WorkoutExercise> exercises;
}

@HiveType(typeId: 3)
class WorkoutExercise{
  @HiveField(0)
  String exercise;
  @HiveField(1)
  List<Set> sets;
}

@HiveType(typeId: 4)
class Set {
  @HiveField(0)
  int number;
  @HiveField(1)
  int numOfReps;
}