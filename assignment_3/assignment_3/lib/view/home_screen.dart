import 'package:assignment_3/bloc/todo_bloc.dart';
import 'package:assignment_3/extensions/screen_handler.dart';
import 'package:assignment_3/view/delete_task.dart';
import 'package:assignment_3/widgets/task_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/add_task_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TodoBloc>(context);

    TextEditingController taskController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: "Welcome, ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black)),
                        TextSpan(
                            text: "John",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blue)),
                        TextSpan(
                            text: ".",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black))
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        context.pushTo(view: const DeleteTaskScreen());
                      },
                      icon: const Icon(Icons.more_horiz)),
                ],
              ),
              BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  if (bloc.serviceLocator.taskList.length -
                          bloc.serviceLocator.completeList.length >
                      0) {
                    return Text(
                      "You’ve got ${bloc.serviceLocator.taskList.length - bloc.serviceLocator.completeList.length} tasks to do.",
                      style: TextStyle(color: Color(0xff8D9CB8), fontSize: 16),
                    );
                  }
                  return Text(
                    "You’ve got 0 tasks to do.",
                    style: TextStyle(color: Color(0xff8D9CB8), fontSize: 16),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  if (state is SuccessState ) {
                    return SizedBox(
                      width: context.getWidth(),
                      height: context.getHeight() * 0.50,
                      child: ListView.builder(
                          itemCount: state.tasks.length,
                          itemBuilder: (context, index) {
                            if (!state.tasks[index].isComplete) {
                              return TaskContainer(
                                tasks: state.tasks[index],
                                checkIcon: Icons.crop_square_rounded,
                                completeTask: () {
                                  bloc.add(CompleteTask(index: index));
                                },
                              );
                            }
                            return SizedBox();
                          }),
                    );
                  }
                  return SizedBox();
                },
              )
            ],
          ),
        ),
      )),
      floatingActionButton: AddTaskButton(
        controller: taskController,
        onTap: () {
          bloc.add(CreateTask(input: taskController.text));
        },
      ),
    );
  }
}
