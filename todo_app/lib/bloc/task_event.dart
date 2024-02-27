part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class FetchTaskEvent extends TaskEvent{}

class CreateNewTask extends TaskEvent{
  String title;
  CreateNewTask({required this.title});
}

class CompleteOneTask extends TaskEvent{
  TaskModel idTask;
  CompleteOneTask({required this.idTask});
}

class DeleteOneTask extends TaskEvent{
  TaskModel idTask;
  DeleteOneTask({required this.idTask});
}

class DeleteAllTask extends TaskEvent{}

