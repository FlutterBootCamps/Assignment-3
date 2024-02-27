import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
    on<ShowCompletedListEvent>(showCompletedList);
    on<EditTaskEvent>(editTask);
  }

  FutureOr<void> addTask(AddTaskEvent event, Emitter<TaskState> emit) {
    String isAddedMsg = locator.addTask(event.taskText);
    if (isAddedMsg.isEmpty){
      emit(AddedTaskState(msg: "${event.taskText} Task has been added!", listOfTasks: locator.getAllIncompleteTasks()));
    }else {
      emit(TaskAddErrorState(msg: isAddedMsg));
    }
  }

  FutureOr<void> deleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) {
    locator.removeTask(event.task);
    emit(DeleteTaskState(msg: "${event.task.task} Task has been deleted", listOfTasks: locator.getAllIncompleteTasks(isEditing: true)));
  }

  FutureOr<void> deleteAllTasks(DeleteAllTasksEvent event, Emitter<TaskState> emit) {
    bool isDeleted = locator.removeAllTasks();
    if (isDeleted){
      emit(DeleteAllTasksState(msg: "All Tasks Have been Deleted!", listOfTasks: locator.getAllIncompleteTasks(isEditing: true)));
    }else {
      emit(DeleteAllTasksState(msg: "Task List is Already Empty!", listOfTasks: locator.getAllIncompleteTasks(isEditing: true)));
    }
  }

  FutureOr<void> completeTask(CompleteTaskEvent event, Emitter<TaskState> emit) {
    locator.completeTask(event.task);
    if (!event.task.isCompleted){
      emit(CompletedTaskState(isHomePage: false, listOfTasks: locator.getAllCompleteTasks(), msg: "${event.task.task} Task has been moved to incomplete list"));
    }else {
    emit(CompletedTaskState(msg: "${event.task.task} Task Completed!", listOfTasks: locator.getAllIncompleteTasks(), isHomePage: event.isHomePage));
    }
  }

  FutureOr<void> showCompletedList(ShowCompletedListEvent event, Emitter<TaskState> emit) {
    emit(CompletedListShownState(listOfTasks: locator.getAllCompleteTasks()));
  }

  FutureOr<void> editTask(EditTaskEvent event, Emitter<TaskState> emit) {
    String isEditedMsg = locator.editTask(event.taskText, event.task);

    if (isEditedMsg.isEmpty){
      emit(EditTaskState(listOfTasks: locator.getAllIncompleteTasks(), msg: "Task has been edited"));
    }else {
      emit(TaskEditErrorState(msg: isEditedMsg));
    }
  }
}
