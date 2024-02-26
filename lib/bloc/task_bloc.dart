import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:tasky_task_manager/data_layer/home_data_layer.dart';
import 'package:tasky_task_manager/models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final locator = GetIt.I.get<HomeData>();
  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {
    });

    on<AddTaskEvent>(addTask);
    on<DeleteTaskEvent>(deleteTask);
    on<DeleteAllTasksEvent>(deleteAllTasks);
    on<CompleteTaskEvent>(completeTask);
  }

  FutureOr<void> addTask(AddTaskEvent event, Emitter<TaskState> emit) {
    String isAddedMsg = locator.addTask(event.taskText);
    if (isAddedMsg.isEmpty){
      emit(AddedTaskState(msg: "${event.taskText} Task has been added!"));
    }else {
      emit(TaskAddErrorState(msg: isAddedMsg));
    }
  }

  FutureOr<void> deleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) {
    locator.removeTask(event.task);
    emit(DeleteTaskState(msg: "${event.task.task} has been deleted"));
  }

  FutureOr<void> deleteAllTasks(DeleteAllTasksEvent event, Emitter<TaskState> emit) {
    bool isDeleted = locator.removeAllTasks();
    if (isDeleted){
      emit(DeleteAllTasksState(msg: "All Tasks Have been Deleted!"));
    }else {
      emit(DeleteAllTasksState(msg: "Task List is Already Empty!"));
    }
  }

  FutureOr<void> completeTask(CompleteTaskEvent event, Emitter<TaskState> emit) {
    locator.completeTask(event.task);
    emit(CompletedTaskState());
  }
}
