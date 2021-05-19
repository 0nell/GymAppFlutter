import 'package:bloc/bloc.dart';

enum ExerciseEvent {click}
enum ExerciseState {category, exercise }

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState>{
  @override
  ExerciseState get initialState => ExerciseState.category;

  @override
  Stream<ExerciseState> mapEventToState(ExerciseEvent event) async*{
    yield ExerciseState.exercise;
  }

}