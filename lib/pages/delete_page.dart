import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/bloc/todo_list_bloc.dart';
import 'package:todo_list/constant/colors.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/widgets/delete_task_widget.dart';
import 'package:todo_list/widgets/person_info_row_widgget.dart';
import 'package:todo_list/widgets/task_widget.dart';

class DeletePage extends StatelessWidget {
  const DeletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 30,
                  ),
                ),
                Spacer(),
                PersonInfoRow(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Delete Tasks",
                  style: GoogleFonts.urbanist(
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<TodoListBloc>(context)
                          .add(DeleteAllItemsEvent());
                    },
                    child: Text(
                      "Delete all ",
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: redColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ))
              ],
            ),
            Expanded(
              child: BlocBuilder<TodoListBloc, TodoListState>(
                builder: (context, state) {
                  if (state is SuccessState && state.listTodo.isNotEmpty) {
                    return ListView(
                      children: [
                        for (TodoTask newTask in state.listTodo)
                          DeleteTaskWidget(
                            task: newTask,
                          )
                      ],
                    );
                  } else {
                    return Center(
                      child: Text(
                        "No Tasks",
                        style: TextStyle(color: bluegreyText),
                      ),
                    );
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
