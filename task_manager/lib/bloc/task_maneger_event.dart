part of 'task_maneger_bloc.dart';

@immutable
sealed class TaskManegerEvent {}

class LoadTask extends TaskManegerEvent {
}

class AddTask extends TaskManegerEvent {
  final String taskTitle;
  AddTask(this.taskTitle);
}

class RemoveTask extends TaskManegerEvent {
  final String taskTitle;
  RemoveTask(this.taskTitle);
}

class UpdateTask extends TaskManegerEvent {
  final Task task;
  UpdateTask(this.task);
}
