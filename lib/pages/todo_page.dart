import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:todo_list/bloc/todo_list_bloc.dart';
import 'package:todo_list/constant/colors.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/pages/delete_page.dart';
import 'package:todo_list/service/setup.dart';
import 'package:todo_list/widgets/bottom_sheet_widget.dart';
import 'package:todo_list/widgets/person_info_row_widgget.dart';
import 'package:todo_list/widgets/task_widget.dart';

class ToDoPage extends StatefulWidget {
  ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  TextEditingController taskController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<TodoListBloc>(context).add(FetchFromLocalStorege());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            PersonInfoRow(),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Welcome,",
                  style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                          fontSize: 22,
                          color: purpleColor,
                          fontWeight: FontWeight.w600)),
                ),
                Text(
                  " John",
                  style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                          fontSize: 22,
                          color: blueColor,
                          fontWeight: FontWeight.w600)),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DeletePage()));
                  },
                  icon: Iconify(
                    Bi.three_dots,
                    color: greyColor,
                  ),
                )
              ],
            ),
            BlocBuilder<TodoListBloc, TodoListState>(builder: (context, state) {
              if (state is SuccessState) {
                return Text(
                  "You’ve got ${state.listTodo.length} tasks to do.",
                  style: TextStyle(color: bluegreyText, fontSize: 16),
                );
              } else {
                return Text("error");
              }
            }),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Stack(children: [
                BlocBuilder<TodoListBloc, TodoListState>(
                  builder: (context, state) {
                    if (state is SuccessState && state.listTodo.isNotEmpty) {
                      return ListView(
                        children: [
                          for (TodoTask newTask in state.listTodo)
                            TaskWidget(
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
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return bottomcontainer(
                                  taskController: taskController);
                            },
                          );
                        },
                        child: Image.asset(
                          'assets/images/plusicon.png',
                          
                        )))
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
