import 'package:assignment_3/bloc/task_manager_bloc.dart';
import 'package:assignment_3/data/data.dart';
import 'package:assignment_3/helper/colors.dart';
import 'package:assignment_3/helper/extintion.dart';
import 'package:assignment_3/pages/to_do_page/widgets/Welcoming_task_page.dart';
import 'package:assignment_3/pages/to_do_page/widgets/floating_button_widget.dart';
import 'package:assignment_3/pages/widgets/containet_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTaskPage extends StatelessWidget {
  const ToDoTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TaskManagerBloc>().add(LaudingDataEvent());
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            "John",
            style: GoogleFonts.urbanist(
                fontSize: 18, fontWeight: FontWeight.w600, color: text),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset("assets/avatar.png"),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<TaskManagerBloc, TaskManagerState>(
          builder: (context, state) {
            if (state is LaudingState || state is TaskManagerInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FinishLaudingState) {
              if (state.tasks.isNotEmpty) {
                return Column(
                  children: [
                    TasksListWelcoming(
                        taskNumber: GetIt.I.get<TaskData>().tasks.length),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.tasks.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Tasks(
                                task: state.tasks[index],
                                colors: text,
                                onPress: () {
                                  context
                                      .read<TaskManagerBloc>()
                                      .add(AddCompletedTaskEvent(tasks: state.tasks[index]));
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        }),
                  ],
                );
              } else {
                return Column(
                  children: [
                    TasksListWelcoming(
                        taskNumber: GetIt.I.get<TaskData>().tasks.length),
                    SizedBox(
                      height: context.getHeight() / 3,
                    ),
                    Text(
                      "There are no tasks yet",
                      style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: text2),
                    ),
                  ],
                );
              }
            } else {
              return Column(
                children: [
                  TasksListWelcoming(
                      taskNumber: GetIt.I.get<TaskData>().tasks.length),
                  SizedBox(
                    height: context.getHeight() / 3,
                  ),
                  Text(
                    "There are no tasks yet",
                    style: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: text2),
                  ),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: Button(),
      
    );
  }
}
