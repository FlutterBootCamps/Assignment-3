import 'dart:async';

import 'package:assignment_3/data/data.dart';
import 'package:assignment_3/data/task_model.dart';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'task_manager_event.dart';
part 'task_manager_state.dart';

class TaskManagerBloc extends Bloc<TaskManagerEvent, TaskManagerState> {
  final data = GetIt.I.get<TaskData>();
  TaskManagerBloc() : super(TaskManagerInitial()) {
    on<TaskManagerEvent>((event, emit) {});
    on<LaudingDataEvent>(lauding);
    on<AddTaskEvent>(addTask);
    on<AddCompletedTaskEvent>(addCompletedTask);
    on<DeleteTaskEvent>(deleteTask);
    on<DeleteAllEvent>(deleteAllTask);
    on<BottomSheetEvent>(showBottomSheet);
  }

  FutureOr<void> lauding(
      LaudingDataEvent event, Emitter<TaskManagerState> emit) async {
    try {
      emit(LaudingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(FinishLaudingState(
          tasks: data.tasks, completedTasks: data.completedTasks));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> addTask(
      AddTaskEvent event, Emitter<TaskManagerState> emit) async {
    if (data.completedTasks.contains(event.tasks)) {
      data.addToTasksFromCompleted(task: event.tasks);
    } else {
      data.addToTasks(task: event.tasks);
    }
    try {
      emit(LaudingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(FinishLaudingState(
          tasks: data.tasks, completedTasks: data.completedTasks));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> deleteTask(
      DeleteTaskEvent event, Emitter<TaskManagerState> emit) async {
    data.deleteTask(task: event.tasks);
    try {
      emit(LaudingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(FinishLaudingState(
          tasks: data.tasks, completedTasks: data.completedTasks));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> deleteAllTask(
      DeleteAllEvent event, Emitter<TaskManagerState> emit) async {
    data.deleteAllTasks();
    try {
      emit(LaudingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(FinishLaudingState(
          tasks: data.tasks, completedTasks: data.completedTasks));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> addCompletedTask(
      AddCompletedTaskEvent event, Emitter<TaskManagerState> emit) async {
    data.addToCompletedTasks(task: event.tasks);
    try {
      emit(LaudingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(FinishLaudingState(
          tasks: data.tasks, completedTasks: data.completedTasks));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> showBottomSheet(
      BottomSheetEvent event, Emitter<TaskManagerState> emit) {
    emit(ShowBottomSheetState(showBottomSheet: event.showBottomSheet));
  }
}
