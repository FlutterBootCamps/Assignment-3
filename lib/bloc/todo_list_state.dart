part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListState {}

final class TodoListInitial extends TodoListState {}
final class LoadingState extends TodoListState {}

final class SuccessState extends TodoListState {
  List<TodoTask> listTodo;
  SuccessState({required this.listTodo});
}
