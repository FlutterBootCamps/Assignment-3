import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task_bloc.dart';
import 'package:todo_app/constant/color.dart';
import 'package:todo_app/constant/space.dart';
import 'package:todo_app/helper/extention.dart';
import 'package:todo_app/model/task_model.dart';

class ContainerTaskWidget extends StatelessWidget {
  ContainerTaskWidget({super.key, required this.task, });
  TaskModel task;


  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TaskBloc>(context);


    return Container(
      width: context.getWidth() * 0.90,
      height: context.getWidth() * 0.2,
      padding: const EdgeInsets.all(8),
        child: Container(
          width: context.getWidth() * 0.90,
          height: context.getWidth() * 0.1,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: taskGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  bloc.add(CompleteOneTask(idTask: task));
                },
                child: Container(
                  width: context.getWidth() * 0.043,
                  height: context.getWidth() * 0.043,
                  decoration: BoxDecoration(
                    // color: taskGrey,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: lightGrey, width: 2),
                  ),
                ),
              ),
              width12,
              Text(
                task.taskTitle,
                style:const TextStyle(
                    color: black, fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
        ),
      ),
    );
  }
}
