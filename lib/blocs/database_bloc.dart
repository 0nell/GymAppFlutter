import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:gymapp/persistence/hive/programme_model.dart';
import 'package:gymapp/persistence/moor_database.dart';
import 'package:hive/hive.dart';

import '../test_main.dart';

class DatabaseEvent extends Equatable{
  const DatabaseEvent();
  @override
  List<Object> get props => [];
}

class DeleteWorkout extends DatabaseEvent{
  final int index;
  const DeleteWorkout(this.index);
}
class AddWorkout extends DatabaseEvent{
  final Workout entry;
  const AddWorkout(this.entry);
}

class DatabaseState extends Equatable{
  const DatabaseState();

  @override
  List<Object> get props => [];

}

class InitialDatabaseState extends DatabaseState{}
class TempDatabaseState extends DatabaseState{}

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState>{
  @override
  DatabaseState get initialState => InitialDatabaseState();
  GymDatabase get db => GymDatabase();
  Box<Programme> get pBox => Hive.box<Programme>(programmeBox);
  Box<Workout> get wBox => Hive.box<Workout>(workoutBox);


  @override
  Stream<DatabaseState> mapEventToState(DatabaseEvent event) async*{
    if(event is DeleteWorkout){
      deleteWorkout(event);
    }
    if(event is AddWorkout){
      addWorkout(event);
    }

    if(state is InitialDatabaseState){
      yield TempDatabaseState();
    }
    yield InitialDatabaseState();
  }

  //Hive Database
  deleteWorkout(DeleteWorkout event){
    wBox.deleteAt(event.index);
  }

  addWorkout(AddWorkout event){
    wBox.add(event.entry);
  }


  //Moor Database
  Future<List<Category>> getAllCategories(){
    return db.getAllCategories();
  }

  Future<List<Exercise>> getExerciseByCategory(Category c){
    return db.getExerciseByCategory(c);
  }



}
