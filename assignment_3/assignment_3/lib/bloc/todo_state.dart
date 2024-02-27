part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class SuccessState extends TodoState {
  final List<TaskModel> tasks;

  SuccessState({required this.tasks});
}

final class ErrorState extends TodoState {}
