import 'package:flutter/material.dart';
import 'package:tasky_task_manager/helpers/extensions/screen_helper.dart';
import 'package:tasky_task_manager/models/task_model.dart';
import 'package:tasky_task_manager/utils/colors.dart';
import 'package:tasky_task_manager/utils/fonts.dart';

class TaskAddBottomSheet extends StatefulWidget {
  const TaskAddBottomSheet({
    super.key,
    required this.noteController, this.onPreseed, required this.buttonText, required this.hintText, this.task,
  });

  final TextEditingController noteController;
  final Function()? onPreseed;
  final String buttonText;
  final String hintText;
  final Task? task;

  @override
  State<TaskAddBottomSheet> createState() => _TaskAddBottomSheetState();
}

class _TaskAddBottomSheetState extends State<TaskAddBottomSheet> {

  @override
  void initState() {
    if (widget.task != null){
      widget.noteController.text = widget.task!.task;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 90),
      width: context.getWidth(context),
      height: 423,
      decoration: const BoxDecoration(color: whiteColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)), boxShadow: [
        BoxShadow(color: shadowColor, blurRadius: 24, offset: Offset(0, -6)),
      ]),
      child: Column(
        children: [
          TextField(
            style: const TextStyle(color: slatePurple, fontFamily: urbanistFont, fontSize: 14,),
            controller: widget.noteController,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: azureColor, fontFamily: urbanistFont, fontSize: 14, fontWeight: FontWeight.w500),
              prefixIcon: Image.asset("assets/icons/pencil.png"),
              border: const UnderlineInputBorder(
                borderSide: BorderSide.none
              )
            ),
          ),
          const SizedBox(height: 48,),
          Align( alignment: Alignment.centerRight, child: TextButton(onPressed: widget.onPreseed, child: Text(widget.buttonText, style: const TextStyle(color: oceanBlueColor, fontFamily: urbanistFont, fontSize: 16, fontWeight: FontWeight.bold),)))
        ],
      ),
    );
  }
}
