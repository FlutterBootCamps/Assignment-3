import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_maneger_bloc.dart';
import 'package:task_manager/model/task_model.dart';

class CheckBox extends StatelessWidget {
  CheckBox({required this.task, Key? key, required this.colorBox}) : super(key: key);
final Color colorBox;
    final Task task;

  @override
  Widget build(BuildContext context) {
    Color color = task.isDone ? colorBox : Colors.grey;
    return IconButton(
      icon: Icon(
        size: 20,
        task.isDone ? Icons.check_box : Icons.check_box_outline_blank,
        color: color,
      ),
      onPressed: () {
        task.isDone = !task.isDone;
     BlocProvider.of<TaskManegerBloc>(context).add(UpdateTask(task));
      },
    );
  }
}
