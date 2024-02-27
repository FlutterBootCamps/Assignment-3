import 'package:flutter_bloc/flutter_bloc.dart';


part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskListState> {

  TaskBloc() : super(TaskListState([])) {
    on<AddTaskEvent>((event, emit) {
      final List<String> updatedTasks = List.from(state.tasks)..add(event.newTask);
      emit(TaskListState(updatedTasks));
    });
  }
}
