import 'package:flutter/material.dart';
import 'package:hw_3_bloc/constant/colors.dart';
import 'package:hw_3_bloc/model/to_do.dart';

class ListTileWidget extends StatelessWidget {
   ListTileWidget(
      {super.key, required this.nameTodo, required this.isCheck, required this.isDelete, this.tasks,});

  final String nameTodo;
  final bool isCheck;
  final bool isDelete;
   Todo? tasks;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: colorTodo,
      leading: isCheck
          ? Icon(
              Icons.check_box_outline_blank,
              color: Color(0xffc6cfcd),
            )
          : null, // Provide null when isCheck is false
      title: Text(
        nameTodo,
        style: TextStyle(
          fontFamily: 'Urbanist',
          fontSize: 16,
          color:isDelete ? Color(0xffc6cfcd) : colorText,
        ),
      ),
      trailing: isDelete ? Icon(
        Icons.delete,
        color: Color(0xffFF5E5E),
      ) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
