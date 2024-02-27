part of 'task_manager_bloc.dart';

@immutable
sealed class TaskManagerEvent {}

class LaudingDataEvent extends TaskManagerEvent {}

class AddTaskEvent extends TaskManagerEvent {
  final TasksModel tasks;
  AddTaskEvent({required this.tasks});
}

class DeleteTaskEvent extends TaskManagerEvent {
  final TasksModel tasks;
  DeleteTaskEvent({required this.tasks});
}

class DeleteAllEvent extends TaskManagerEvent {}

class AddCompletedTaskEvent extends TaskManagerEvent {
  final TasksModel tasks;

  AddCompletedTaskEvent({required this.tasks});
}

class BottomSheetEvent extends TaskManagerEvent {
  final bool showBottomSheet;

  BottomSheetEvent({this.showBottomSheet = false});
}
