import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task_bloc.dart';
import 'package:todo_app/constant/color.dart';
import 'package:todo_app/constant/space.dart';
import 'package:todo_app/data_layer/data_service.dart';
import 'package:todo_app/service/setup.dart';
import 'package:todo_app/widgets/completed_task_widget.dart';
import 'package:todo_app/widgets/empty_completed_task_widget.dart';

class CompleteScreen extends StatelessWidget {
  const CompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TaskBloc>(context);
    bloc.add(FetchTaskEvent());

    final serviceLocator = locator.get<DataService>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(195),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, right: 30),
          child: AppBar(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "John",
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  width12,
                  Image.asset(
                    "asset/images/person_avatar.png",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  if (state is ShowAllTaskState) {
                    if (serviceLocator.completedTask.isEmpty) {
                      return const EmptyCompletedTask();
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: serviceLocator.completedTask.length,
                          itemBuilder: (context, index) {
                            return CompletedTask(
                              task:
                                  serviceLocator.completedTask[index],
                            );
                          });
                    }
                  }
                  return const EmptyCompletedTask(); 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
