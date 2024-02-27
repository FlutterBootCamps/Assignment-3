part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

class loadingState extends TaskState {}

class StartState extends TaskState {
  List allTask;
  StartState({required this.allTask});
}

class ShowAllTaskState extends TaskState {
  List allTask;
  ShowAllTaskState({required this.allTask});
}



