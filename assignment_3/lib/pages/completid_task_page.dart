import 'package:assignment_3/bloc/task_manager_bloc.dart';
import 'package:assignment_3/helper/colors.dart';
import 'package:assignment_3/helper/extintion.dart';
import 'package:assignment_3/pages/widgets/containet_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletidTaskPage extends StatelessWidget {
  const CompletidTaskPage({super.key});

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
              if (state.completedTasks.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.completedTasks.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Tasks(
                                task: state.completedTasks[index],
                                colors: text,
                                checkVisibility: true,
                                onPress: () {
                                  context.read<TaskManagerBloc>().add(
                                      (AddTaskEvent(
                                          tasks: state
                                              .completedTasks[index])));
                                },
                                isVisible: true,
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
                    SizedBox(
                      height: context.getHeight() / 3.5,
                    ),
                    Image.asset("assets/completed.png"),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "not complete",
                        style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: text2),
                      ),
                    ),
                  ],
                );
              }
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: context.getHeight() / 2,
                  ),
                  Image.asset("assets/completed.png"),
                  Center(
                    child: Text(
                      "not complete",
                      style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: text2),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
