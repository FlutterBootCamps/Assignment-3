import 'package:bloc/bloc.dart';
import 'package:hw_3_bloc/data%20layer/data.dart';
import 'package:hw_3_bloc/model/to_do.dart';
import 'package:hw_3_bloc/utils/get_it.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final serviceLocator = locator.get<DataHome>();
  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {});

    on<AddToDoEvent>(
      (event, emit) {
        serviceLocator.addToDo(event.task);
        emit(AddTodoState(tasks: serviceLocator.taskList));
      },
    );
  }
}
