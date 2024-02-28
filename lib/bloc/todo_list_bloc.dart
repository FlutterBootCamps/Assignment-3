import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/data/data_service.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/service/setup.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  // gitit
  final serviceLocate = locater.get<DataService>();
  TodoListBloc() : super(TodoListInitial()) {
    on<TodoListEvent>((event, emit) {
      // TODO: implement event handler
    });

// to create task
    on<CreateTaskEvent>((event, emit) {
      serviceLocate.addTask(event.createTask);
      emit(SuccessState(listTodo: serviceLocate.todoList));
    });

// to delete task
    on<DeleteTaskEvent>((event, emit) {
      serviceLocate.deleteTask(event.deleteTask);
      emit(SuccessState(listTodo: serviceLocate.todoList));
    });

// to delete all items
    on<DeleteAllItemsEvent>((event, emit) {
      serviceLocate.deletAllItems();
      emit(SuccessState(listTodo: serviceLocate.todoList));
    });

// to change isDone , complete task
    on<ChangeIsDone>((event, emit) {
      serviceLocate.doneTask(event.task);
      emit(SuccessState(listTodo: serviceLocate.todoList));
    });

    on<FetchFromLocalStorege>((event, emit) {
      serviceLocate.getAllTasks();
      emit(SuccessState(listTodo: serviceLocate.todoList));
    });
  }
}
