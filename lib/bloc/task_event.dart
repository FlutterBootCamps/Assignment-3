part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}
class AddEvent extends TaskEvent{} 
class DeletEvent extends TaskEvent{} 
class SaveEvent extends TaskEvent{} 

