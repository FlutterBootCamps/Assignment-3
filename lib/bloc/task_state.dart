part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class AddedTaskState extends TaskState {
final String msg;

AddedTaskState({required this.msg});
}

final class TaskAddErrorState extends TaskState {
  final String msg;

  TaskAddErrorState({required this.msg});
}

final class DeleteTaskState extends TaskState {
  final String msg;

  DeleteTaskState({required this.msg});
}

final class DeleteAllTasksState extends TaskState {
  final String msg;

  DeleteAllTasksState({required this.msg});
}

final class CompletedTaskState extends TaskState {

}