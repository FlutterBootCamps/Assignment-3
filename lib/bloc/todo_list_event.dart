part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListEvent {}

final class TaskCompleteEvent extends TodoListEvent {}

final class CreateTaskEvent extends TodoListEvent {
  TodoTask createTask;
  CreateTaskEvent({required this.createTask});
}

final class DeleteTaskEvent extends TodoListEvent {
  TodoTask deleteTask;
  DeleteTaskEvent({required this.deleteTask});
}

final class DeleteAllItemsEvent extends TodoListEvent {}

final class ChangeIsDone extends TodoListEvent {
  TodoTask task;
  ChangeIsDone({required this.task});
}

final class FetchFromLocalStorege extends TodoListEvent {}
