import 'package:assignment_3/bloc/todo_bloc.dart';
import 'package:assignment_3/extensions/screen_handler.dart';
import 'package:assignment_3/widgets/task_container.dart';
import 'package:assignment_3/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteTaskScreen extends StatelessWidget {
  const DeleteTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        actions: const [UserInfo()],
      ),
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
                  Text(
                    "Delete Tasks",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                      bloc.add(DeleteAllTask());
                    },
                    child: Text("Delete all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    return SizedBox(
                      width: context.getWidth(),
                      height: context.getHeight() * 0.50,
                      child: ListView.builder(
                          itemCount: state.tasks.length,
                          itemBuilder: (context, index) {
                            return TaskContainer(
                              tasks: state.tasks[index],
                              deleteIcon: Icons.delete,
                              deleteTask: () {
                                bloc.add(DeleteTask(index: index));
                              },
                            );
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
    );
  }
}
