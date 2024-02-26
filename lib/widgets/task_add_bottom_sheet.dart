import 'package:flutter/material.dart';
import 'package:tasky_task_manager/helpers/extensions/screen_helper.dart';
import 'package:tasky_task_manager/utils/colors.dart';
import 'package:tasky_task_manager/utils/fonts.dart';

class TaskAddBottomSheet extends StatelessWidget {
  const TaskAddBottomSheet({
    super.key,
    required this.noteController, this.onPreseed,
  });

  final TextEditingController noteController;
  final Function()? onPreseed;

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
            controller: noteController,
            decoration: InputDecoration(
              hintText: "Add a note...",
              hintStyle: const TextStyle(color: azureColor, fontFamily: urbanistFont, fontSize: 14, fontWeight: FontWeight.w500),
              prefixIcon: Image.asset("assets/icons/pencil.png"),
              border: const UnderlineInputBorder(
                borderSide: BorderSide.none
              )
            ),
          ),
          const SizedBox(height: 48,),
          Align( alignment: Alignment.centerRight, child: TextButton(onPressed: onPreseed, child: const Text("Create", style: TextStyle(color: oceanBlueColor, fontFamily: urbanistFont, fontSize: 16, fontWeight: FontWeight.bold),)))
        ],
      ),
    );
  }
}
