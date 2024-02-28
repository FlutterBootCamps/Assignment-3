import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/bloc/todo_list_bloc.dart';
import 'package:todo_list/constant/colors.dart';
import 'package:todo_list/models/todo_model.dart';

class bottomcontainer extends StatelessWidget {
  const bottomcontainer({
    super.key,
    required this.taskController,
  });

  final TextEditingController taskController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
                hintText: 'Add a note... ',
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      BlocProvider.of<TodoListBloc>(context).add(
                          CreateTaskEvent(
                              createTask: TodoTask(taskController.text)));
                      Navigator.pop(context);
                      taskController.clear();
                    },
                    child: Text(
                      "Create",
                      style: GoogleFonts.ubuntu(
                          color: creatColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
