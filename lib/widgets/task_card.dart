import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_task_manager/bloc/task_bloc.dart';
import 'package:tasky_task_manager/helpers/extensions/screen_helper.dart';
import 'package:tasky_task_manager/models/task_model.dart';
import 'package:tasky_task_manager/utils/colors.dart';
import 'package:tasky_task_manager/utils/fonts.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key, required this.task,
  });
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
      margin: const EdgeInsets.only(bottom: 16),
      width: context.getWidth(context),
      height: 56,
      decoration: const BoxDecoration(color: paleWhite, borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Row(
        children: [
          Checkbox(value: task.isCompleted, onChanged: (value){
            context.read<TaskBloc>().add(CompleteTaskEvent(task: task));
          }, activeColor: oceanBlueColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),), side: const BorderSide(color: azureColor, width: 2)),
          Flexible(child: Text(task.task, style: const TextStyle(color: slatePurple, fontFamily: urbanistFont, fontSize: 16, fontWeight: FontWeight.w600,),))
        ],
      ),
    );
  }
}