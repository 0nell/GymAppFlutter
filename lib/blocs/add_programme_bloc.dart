import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProgrammeEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SetDurationEvent extends AddProgrammeEvent{}
class AddWorkoutEvent extends AddProgrammeEvent{}
class RemoveWorkoutEvent extends AddProgrammeEvent{}
class SaveEvent extends AddProgrammeEvent{}

class AddProgrammeState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class InitialState extends AddProgrammeState{}
class TempState extends AddProgrammeState{}

class AddProgrammeBloc extends Bloc<AddProgrammeEvent, AddProgrammeState>{
  @override
  // TODO: implement initialState
  AddProgrammeState get initialState => InitialState();

  @override
  Stream<AddProgrammeState> mapEventToState(AddProgrammeEvent event) async*{
    if(state is InitialState){
      yield TempState();
    }
    yield InitialState();
  }
  
}