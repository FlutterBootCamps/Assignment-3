
import 'package:flutter/material.dart';
import 'package:task_manager/component/check_box.dart';
import 'package:task_manager/component/customText.dart';
import 'package:task_manager/const/const_color.dart';
import 'package:task_manager/model/task_model.dart';

class RowTask extends StatelessWidget {
  const RowTask({
    super.key, required this.task,this.isDelete =false,
  });
 final bool isDelete;
final Task task;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: taskBackgroundColor,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(children: [if(task.isDone==false)
CheckBox(task:task,colorBox: isDelete ? ColorSubText : ColorText ),
        CustomText(
            text: task.task,
            color: isDelete ? ColorSubText : ColorText,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ]),
    );
  }
}
