part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class AddToDoEvent extends TodoEvent{
   final String task;
  AddToDoEvent({required this.task});
}

final class LoadEvent extends TodoEvent {}