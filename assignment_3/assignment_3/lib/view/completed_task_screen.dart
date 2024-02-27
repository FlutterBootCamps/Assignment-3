import 'package:assignment_3/bloc/todo_bloc.dart';
import 'package:assignment_3/extensions/screen_handler.dart';
import 'package:assignment_3/widgets/no_complete_task.dart';
import 'package:assignment_3/widgets/task_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                print(state);
                if (state is SuccessState) {
                  if (state.tasks.isEmpty) {
                    return NoCompleteTask();
                  }
                  return SizedBox(
                    width: context.getWidth(),
                    height: context.getHeight() * 0.50,
                    child: ListView.builder(
                        itemCount: state.tasks.length,
                        itemBuilder: (context, index) {
                          if (state.tasks[index].isComplete) {
                            return TaskContainer(
                              tasks: state.tasks[index],
                            );
                          }
                          return SizedBox();
                        }),
                  );
                }
                return NoCompleteTask();
              },
            )
          ],
        ),
      )),
    );
  }
}

