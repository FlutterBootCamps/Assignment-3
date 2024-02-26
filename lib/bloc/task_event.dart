part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

final class AddTaskEvent extends TaskEvent{
final String taskText;

AddTaskEvent({required this.taskText});
}

final class DeleteTaskEvent extends TaskEvent {
  final Task task;

  DeleteTaskEvent({required this.task});
}

final class DeleteAllTasksEvent extends TaskEvent {
  
}

final class CompleteTaskEvent extends TaskEvent {
  final Task task;

  CompleteTaskEvent({required this.task});
}