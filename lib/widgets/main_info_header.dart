import 'package:flutter/material.dart';
import 'package:tasky_task_manager/utils/colors.dart';
import 'package:tasky_task_manager/utils/fonts.dart';
import 'package:tasky_task_manager/widgets/welcome_statement.dart';

class MainInfoHeader extends StatelessWidget {
  const MainInfoHeader({
    super.key, required this.name, required this.numOfTasks, this.onTap,
  });
  final String name;
  final int numOfTasks;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeSentence(name: name,),
            Text("You’ve got $numOfTasks tasks to do.", style: const TextStyle(color: slateBlue, fontFamily: urbanistFont, fontSize: 16, fontWeight: FontWeight.w500),)
          ],
        ),
        IconButton(onPressed: onTap, icon: Image.asset("assets/icons/dots.png"))
      ],
    );
  }
}

