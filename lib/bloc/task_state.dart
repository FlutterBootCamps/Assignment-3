part of 'task_bloc.dart'; // تأكد من أن اسم الملف مطابق لاسم الملف الذي يحتوي على TaskBloc

abstract class TaskState {}

class TaskListState extends TaskState {
  final List<String> tasks;

  TaskListState( this.tasks);
}
