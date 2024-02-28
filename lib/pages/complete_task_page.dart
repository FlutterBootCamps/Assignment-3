import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/bloc/todo_list_bloc.dart';
import 'package:todo_list/constant/colors.dart';
import 'package:todo_list/data/data_service.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/service/setup.dart';
import 'package:todo_list/widgets/person_info_row_widgget.dart';
import 'package:todo_list/widgets/task_widget.dart';

class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  @override
  Widget build(BuildContext context) {
    final serviceLocate = locater.get<DataService>();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(23.0),
        child: Column(
          children: [
            PersonInfoRow(),
            Expanded(
              child: BlocBuilder<TodoListBloc, TodoListState>(
                builder: (context, state) {
                  if (state is SuccessState || state is TodoListInitial) {
                    List<TodoTask> completeTask = serviceLocate.completedList();
                    print(completeTask.length);
                    if (completeTask.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/noComplete.png',
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Text(
                            "not complete",
                            style: TextStyle(color: bluegreyText),
                          )
                        ],
                      );
                    } else {
                      return ListView(
                        children: [
                          for (TodoTask newTask in completeTask)
                            TaskWidget(
                              task: newTask,
                              isComplete: true,
                            )
                        ],
                      );
                    }
                  }
                  return Text("error");
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
