part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class AddedTaskState extends TaskState {
final List<Widget> listOfTasks;
final String msg;

AddedTaskState({required this.listOfTasks,required this.msg});
}

final class TaskAddErrorState extends TaskState {
  final String msg;

  TaskAddErrorState({required this.msg});
}

final class DeleteTaskState extends TaskState {
  final List<Widget> listOfTasks;
  final String msg;

  DeleteTaskState({required this.listOfTasks, required this.msg});
}

final class DeleteAllTasksState extends TaskState {
  final List<Widget> listOfTasks;
  final String msg;

  DeleteAllTasksState({required this.listOfTasks, required this.msg});
}

final class CompletedTaskState extends TaskState {
  final List<Widget> listOfTasks;
  final String msg;
  final bool isHomePage;

  CompletedTaskState({required this.isHomePage,required this.listOfTasks ,required this.msg});
}

final class CompletedListShownState extends TaskState {
  final List<Widget> listOfTasks;

  CompletedListShownState({required this.listOfTasks});
}

final class EditTaskState extends TaskState {
final List<Widget> listOfTasks;
final String msg;

EditTaskState({required this.listOfTasks,required this.msg});
}

final class TaskEditErrorState extends TaskState {
  final String msg;

  TaskEditErrorState({required this.msg});
}