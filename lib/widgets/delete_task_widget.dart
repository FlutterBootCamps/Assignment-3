import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/bloc/todo_list_bloc.dart';
import 'package:todo_list/constant/colors.dart';
import 'package:todo_list/models/todo_model.dart';

class DeleteTaskWidget extends StatelessWidget {
  DeleteTaskWidget({super.key, required this.task});
  TodoTask task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
          color: taskColor, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: bluegreyText),
              borderRadius: BorderRadius.circular(7.0),
            ),
            value: false,
            onChanged: (newValue) {
              task.isDone;
            },
          ),
          Text(
            task.title,
            style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: bluegreyText)),
          ),
          Spacer(),
          IconButton(
            onPressed: (){
                     BlocProvider.of<TodoListBloc>(context)
                    .add(DeleteTaskEvent(deleteTask: task));
            },
            icon: Icon(
              Icons.delete,
              color: redColor,
            ),
          )
        ],
      ),
    );
  }
}
