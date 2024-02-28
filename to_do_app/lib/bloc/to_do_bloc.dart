import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoInitial()) {
    on<ToDoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
