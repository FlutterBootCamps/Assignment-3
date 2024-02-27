import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/data_layer/data_service.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/service/setup.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  final serviceLocator = locator.get<DataService>();

  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {
      // serviceLocator.showAllTasks();
      // TODO: implement event handler
    });


    // on<FetchTaskEvent>(((event, emit) {    
    //   serviceLocator.showAllTasks();
    //   emit(ShowAllTaskState(allTask: serviceLocator.allTask));
    // }));

    on<CreateNewTask>((event, emit){
      serviceLocator.createNewTask(event.title);
      print("bloc create new task");
      emit(ShowAllTaskState(allTask: serviceLocator.allTask));
    });


    on<CompleteOneTask>((event, state) {
      serviceLocator.completeTask(event.idTask);
      emit(ShowAllTaskState(allTask: serviceLocator.allTask));
    });


    on<DeleteOneTask>((event, state) async{
      await serviceLocator.deleteOneTask(event.idTask);
      print("delete event ${event.idTask}");
      emit(ShowAllTaskState(allTask: serviceLocator.allTask));
    });


    on<DeleteAllTask>((event, emit) {      
    serviceLocator.deleteAlleTask();
    emit(ShowAllTaskState(allTask: serviceLocator.allTask));
    });

  }
}
