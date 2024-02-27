import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task_bloc.dart';
import 'package:todo_app/constant/color.dart';
import 'package:todo_app/constant/space.dart';
import 'package:todo_app/helper/extention.dart';
import 'package:todo_app/model/task_model.dart';

class DeleteTaskWidget extends StatelessWidget {
  DeleteTaskWidget({super.key, required this.idTask});
  TaskModel idTask;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TaskBloc>(context);

    return Container(
      width: context.getWidth() * 0.90,
      height: context.getWidth() * 0.2,
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: (){
                  bloc.add(CompleteOneTask(idTask: idTask));
                },
        child: Container(
          width: context.getWidth() * 0.90,
          height: context.getWidth() * 0.1,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: taskGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: lightGrey,
                  ),
                  width12,
                  Text(
                    idTask.taskTitle,
                    style: const TextStyle(
                        color: lightGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  bloc.add(DeleteOneTask(idTask: idTask));
                },
                child: const Icon(
                  Icons.delete,
                  color: red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
