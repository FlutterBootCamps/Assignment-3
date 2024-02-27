import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:task_manager/data_layer/data_layer.dart';
import 'package:task_manager/model/task_model.dart';

part 'task_maneger_event.dart';
part 'task_maneger_state.dart';

class TaskManegerBloc extends Bloc<TaskManegerEvent, TaskManegerState> {
  TaskManegerBloc() : super(TaskManegerInitial()) {
    final GetItem = GetIt.I.get<TaskMangerGetStorge>();

    on<TaskManegerEvent>((event, emit) {
      GetItem.allTask=GetItem.LoadList();
      emit(LoadState(GetItem.allTask));
    });
    on<AddTask>((event, emit) {
      GetItem.allTask.add(Task(task: event.taskTitle));
      GetItem.SaveList();
      emit(LoadState(GetItem.allTask));
    });
    on<RemoveTask>((event, emit) {
      for (var i in GetItem.allTask) {
        if (i.task == event.taskTitle) {
          GetItem.allTask.remove(i);
        }
      }
      emit(LoadState(GetItem.allTask));
    });
    on<UpdateTask>((event, emit) {
      for (var i=0;i<GetItem.allTask.length;i++) {
        if (GetItem.allTask[i].task == event.task.task) {
          GetItem.allTask[i] = event.task;
        }
      }
      emit(LoadState(GetItem.allTask));
    });
  }
}