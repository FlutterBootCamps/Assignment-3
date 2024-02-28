part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class AddTodoState extends TodoState {
  final List<Todo> tasks;

  AddTodoState({required this.tasks});
}

final class ErrorState extends TodoState {}