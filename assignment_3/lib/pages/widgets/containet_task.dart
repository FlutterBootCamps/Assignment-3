import 'package:assignment_3/bloc/task_manager_bloc.dart';
import 'package:assignment_3/data/task_model.dart';
import 'package:assignment_3/helper/colors.dart';
import 'package:assignment_3/helper/extintion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Tasks extends StatelessWidget {
  const Tasks(
      {super.key,
      required this.task,
      required this.colors,
      this.isVisible = false,
      this.onPress,
      this.checkVisibility = false});
  final TasksModel task;
  final Color colors;
  final bool isVisible;
  final bool checkVisibility;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getWidth() / 7,
      width: context.getWidth(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: container),
      child: ListTile(
        leading: InkWell(
            onTap: onPress,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                height: context.getWidth() / 15,
                width: context.getWidth() / 15,
                decoration: BoxDecoration(
                    border: Border.all(color: check, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Visibility(
                    visible: checkVisibility,
                    child: Icon(
                      Icons.check,
                      color: blue,
                    )),
              ),
            )),
        title: Text(task.title,
            style: GoogleFonts.urbanist(
                fontSize: 16, fontWeight: FontWeight.w600, color: text)),
        trailing: Visibility(
            visible: isVisible,
            child: InkWell(
                onTap: () {
                  context
                      .read<TaskManagerBloc>()
                      .add(DeleteTaskEvent(tasks: task));
                },
                child: Icon(Icons.delete, color: red))),
      ),
    );
  }
}
