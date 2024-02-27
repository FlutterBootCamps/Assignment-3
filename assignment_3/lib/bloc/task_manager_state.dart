part of 'task_manager_bloc.dart';

@immutable
sealed class TaskManagerState {}

final class TaskManagerInitial extends TaskManagerState {}

final class LaudingState extends TaskManagerState {}

final class FinishLaudingState extends TaskManagerState {
  final List<TasksModel> tasks;
  final List<TasksModel> completedTasks;

  FinishLaudingState({required this.completedTasks, required this.tasks});
}

final class ErrorState extends TaskManagerState {}

final class ShowBottomSheetState extends TaskManagerState {
  final bool showBottomSheet;

  ShowBottomSheetState({required this.showBottomSheet});
}
