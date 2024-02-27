part of 'task_bloc.dart'; // تأكد من أن اسم الملف مطابق لاسم الملف الذي يحتوي على TaskBloc

abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final String newTask;

  AddTaskEvent(this.newTask);
}
