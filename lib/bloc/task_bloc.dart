import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:start2/data_layer/setup.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {
    // final boxs =box.;
    });
     on<TaskEvent>((event, emit) {
     
    });
  }
}
