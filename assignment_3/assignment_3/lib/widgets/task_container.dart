import 'package:assignment_3/extensions/screen_handler.dart';
import 'package:assignment_3/model/task_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskContainer extends StatelessWidget {
  TaskContainer(
      {super.key,
      this.deleteIcon,
      this.tasks,
      this.completeTask,
      this.deleteTask,
      this.checkIcon});

  IconData? deleteIcon;
  IconData? checkIcon;

  TaskModel? tasks;
  Function()? completeTask;
  Function()? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: context.getWidth(),
      height: context.getHeight() * 0.10,
      decoration: BoxDecoration(
          color: const Color(0xffF5F7F9),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          IconButton(
              onPressed: completeTask,
              icon: Icon(
                checkIcon,
                color: Color(0xffC6CFDC),
                size: 50,
              )),
          Text(
            tasks?.title ?? 'Test Task',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Spacer(),
          IconButton(
              onPressed: deleteTask,
              icon: Icon(
                deleteIcon,
                color: Colors.red,
                size: 24,
              )),
        ],
      ),
    );
  }
}
