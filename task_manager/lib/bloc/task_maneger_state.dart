part of 'task_maneger_bloc.dart';

@immutable
sealed class TaskManegerState {}

final class TaskManegerInitial extends TaskManegerState {
}

final class OnlyShowList extends TaskManegerState {
  final List<Task> tasks;
  OnlyShowList(this.tasks);
}

final class LoadState extends TaskManegerState {
  final List<Task> tasks;
  LoadState(this.tasks);
}

final class ListUpdate extends TaskManegerState {
  final List<Task> tasks;
  ListUpdate(this.tasks);
}
