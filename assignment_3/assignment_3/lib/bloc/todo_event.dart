part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class LoadingEvent extends TodoEvent {}

final class CreateTask extends TodoEvent {
  final String input;
  CreateTask({required this.input});
}

final class DeleteTask extends TodoEvent {
  final int index;
  DeleteTask({required this.index});
}

final class DeleteAllTask extends TodoEvent {}

final class CompleteTask extends TodoEvent {
  final int index;
  CompleteTask({required this.index});
}
