import 'package:assignment_3/bloc/task_manager_bloc.dart';
import 'package:assignment_3/data/task_model.dart';
import 'package:assignment_3/helper/colors.dart';
import 'package:assignment_3/helper/extintion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  Button({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.black,
        tooltip: 'add task',
        elevation: 5,
        shape: const CircleBorder(
            eccentricity: 1, side: BorderSide(color: Colors.white, width: 2)),
        child: const Icon(Icons.add_sharp,
            color: Colors.white,
            size: 55,
            shadows: [
              BoxShadow(
                  blurStyle: BlurStyle.inner,
                  color: Colors.grey,
                  spreadRadius: 30,
                  offset: Offset.infinite)
            ]),
        onPressed: () {
          showModalBottomSheet<void>(
            barrierColor: Colors.white.withOpacity(0),
            context: context,
            elevation: 10,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(20),
                height: context.getHeight() / 2.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5, 5),
                          spreadRadius: 10,
                          blurRadius: 20,
                          blurStyle: BlurStyle.normal)
                    ]),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 30),
                      Center(
                        child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                                icon: Image.asset("assets/leading_icon.png"),
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.urbanist(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: text2),
                                hintText: "Add a note..."),
                            onSubmitted: (value) {
                              if (controller.text.isNotEmpty) {
                                TasksModel task =
                                    TasksModel(title: controller.text);
                                context
                                    .read<TaskManagerBloc>()
                                    .add((AddTaskEvent(tasks: task)));
                                controller.clear();
                                Navigator.pop(context);
                              } else {
                                showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertDialog(
                                        title: Center(
                                          child: Text('enter task title'),
                                        ),
                                      );
                                    });
                              }
                            }),
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.text.isNotEmpty) {
                            TasksModel task =
                                TasksModel(title: controller.text);
                            context
                                .read<TaskManagerBloc>()
                                .add((AddTaskEvent(tasks: task)));
                            controller.clear();
                            Navigator.pop(context);
                          } else {
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    title: Center(
                                      child: Text('enter task title'),
                                    ),
                                  );
                                });
                          }
                        },
                        child: Text(
                          "create",
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: blue),
                        ),
                      ),
                    ]),
              );
            },
          );
        });
  }
}
