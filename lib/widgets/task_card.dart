import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_task_manager/bloc/task_bloc.dart';
import 'package:tasky_task_manager/helpers/extensions/screen_helper.dart';
import 'package:tasky_task_manager/models/task_model.dart';
import 'package:tasky_task_manager/utils/colors.dart';
import 'package:tasky_task_manager/utils/fonts.dart';
import 'package:tasky_task_manager/widgets/task_add_bottom_sheet.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key, required this.task, this.isEditing = false,
  });
  final Task task;
  final bool? isEditing;

  @override
  Widget build(BuildContext context) {
    TextEditingController noteController = TextEditingController();
    return Container(
      padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
      margin: const EdgeInsets.only(bottom: 16),
      width: context.getWidth(context),
      // height: 56,
      decoration: const BoxDecoration(color: paleWhite, borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Row(
        children: [
          Checkbox(value: task.isCompleted, onChanged: (value){
            context.read<TaskBloc>().add(CompleteTaskEvent(task: task, isHomePage: (isEditing!) ? false : true));
          }, activeColor: oceanBlueColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),), side: const BorderSide(color: azureColor, width: 2)),
          Expanded(child: Text(task.task, style: TextStyle(color: isEditing! ? slateBlue : slatePurple, fontFamily: urbanistFont, fontSize: 16, fontWeight: FontWeight.w600, overflow: TextOverflow.fade),)),
          // Wrapped with InkWell instead of IconButton to remove the autmatic IconButton Padding
          (isEditing!) ? Row(
            children: [
              InkWell(
                onTap: (){
                  showModalBottomSheet(context: context, builder: (context) {
                    return TaskAddBottomSheet(noteController: noteController, buttonText: "Edit", hintText: "Edit this task...", task: task, onPreseed: (){
                      context.read<TaskBloc>().add(EditTaskEvent(task: task, taskText: noteController.text));
                      Navigator.pop(context);
                    }
                    ,);
                  },);
                },
                child: Image.asset("assets/icons/pencil_blue.png")),
                const SizedBox(width: 16,),
              InkWell(
                onTap: (){
                  context.read<TaskBloc>().add(DeleteTaskEvent(task: task));
                },
                child: Image.asset("assets/icons/trash.png")),
            ],
          ) : Container()
        ],
      ),
    );
  }
}