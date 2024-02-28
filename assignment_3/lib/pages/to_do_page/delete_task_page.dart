import 'package:assignment_3/bloc/task_manager_bloc.dart';
import 'package:assignment_3/helper/colors.dart';
import 'package:assignment_3/helper/extintion.dart';
import 'package:assignment_3/pages/widgets/containet_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteTask extends StatelessWidget {
  const DeleteTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delete Tasks",
                  style: GoogleFonts.urbanist(
                      fontSize: 20, fontWeight: FontWeight.bold, color: text),
                ),
                InkWell(
                  onTap: () {
                    context
                        .read<TaskManagerBloc>()
                        .add((DeleteAllEvent()));
                  },
                  child: Text(
                    "Delete all",
                    style: GoogleFonts.urbanist(
                        fontSize: 18, fontWeight: FontWeight.w600, color: red),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            BlocBuilder<TaskManagerBloc, TaskManagerState>(
              builder: (context, state) {
                if (state is LaudingState || state is TaskManagerInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FinishLaudingState) {
                  if (state.tasks.isNotEmpty) {
                    return Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.tasks.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Tasks(
                                    task: state.tasks[index],
                                    colors: text2,
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
                          height: context.getHeight() / 3,
                        ),
                        Text(
                          "There are no tasks to delete",
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
                      SizedBox(
                        height: context.getHeight() / 3,
                      ),
                      Center(
                        child: Text(
                          "There are no tasks to delete",
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
          ],
        ),
      ),
    );
  }
}
