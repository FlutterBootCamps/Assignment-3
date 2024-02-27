import 'dart:async';

import 'package:assignment_3/data_layer/data_services.dart';
import 'package:assignment_3/model/task_model.dart';
import 'package:assignment_3/utils/setup.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final serviceLocator = locator.get<DataServices>();

  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {

    });
    on<LoadingEvent>(methodLoading);
    on<CreateTask>(methodCreateTask);
    on<CompleteTask>(methodCompleteTask);
    on<DeleteTask>(methodDeleteTask);
    on<DeleteAllTask>(methodDeleteAllTask);
  }

  FutureOr<void> methodCreateTask(CreateTask event, Emitter<TodoState> emit) {
    serviceLocator.addTask(event.input);
    emit(SuccessState(tasks: serviceLocator.taskList));
  }

  FutureOr<void> methodCompleteTask(
      CompleteTask event, Emitter<TodoState> emit) {
    serviceLocator.completeTask(event.index);
    emit(SuccessState(tasks: serviceLocator.taskList));
  }

  FutureOr<void> methodDeleteTask(DeleteTask event, Emitter<TodoState> emit) {
    serviceLocator.deleteTask(event.index);
    emit(SuccessState(tasks: serviceLocator.taskList));
  }

  FutureOr<void> methodDeleteAllTask(
      DeleteAllTask event, Emitter<TodoState> emit) {
    serviceLocator.deleteAllTask();
    emit(SuccessState(tasks: serviceLocator.taskList));
  }

  FutureOr<void> methodLoading(LoadingEvent event, Emitter<TodoState> emit)  async{
    await serviceLocator.loadData();
    emit(SuccessState(tasks: serviceLocator.taskList));
  }
}
