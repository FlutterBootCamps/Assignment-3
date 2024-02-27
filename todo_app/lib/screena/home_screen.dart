import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/bloc/task_bloc.dart';
import 'package:todo_app/constant/color.dart';
import 'package:todo_app/constant/space.dart';
import 'package:todo_app/data_layer/data_service.dart';
import 'package:todo_app/helper/extention.dart';
import 'package:todo_app/screena/delete_task_screen.dart';
import 'package:todo_app/service/setup.dart';
import 'package:todo_app/widgets/container_task_widget.dart';
import 'package:todo_app/widgets/create_new_task_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TaskBloc>(context);
    bloc.add(FetchTaskEvent());

    final serviceLocator = locator.get<DataService>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Welcome, ",
                                  style: GoogleFonts.getFont(
                                    'Urbanist',
                                    textStyle: const TextStyle(
                                        color: black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Text( "John",
                                style: GoogleFonts.getFont(
                                  'Urbanist',
                                  textStyle: const TextStyle(
                                      color: blue,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text( ". ",
                                style: GoogleFonts.getFont(
                                  'Urbanist',
                                  textStyle: const TextStyle(
                                      color: black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                context.pushTo(view: const DeleteScreen());
                              },
                              icon: const Icon(
                                Icons.more_horiz,
                                color: lightGrey,
                              )),
                        ],
                      ),
                      BlocBuilder<TaskBloc, TaskState>(
                        builder: (context, state) {
                          if (state is ShowAllTaskState) {
                            return Text(
                              "You’ve got ${state.allTask.length} tasks to do.",
                              style: const TextStyle(
                                  color: grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            );
                          }
                          return const Text(
                              "You’ve got 0 tasks to do.",
                              style: TextStyle(
                                  color: grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            );// const SizedBox.shrink();
                        },
                      ),
                      height40,
                      BlocBuilder<TaskBloc, TaskState>(
                        builder: (context, state) {
                          if (state is loadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is ShowAllTaskState) {
                            //ShowAllTaskState
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: serviceLocator.allTask.length,
                                itemBuilder: (context, index) {
                                  return ContainerTaskWidget(
                                      task: serviceLocator.allTask[index]);
                                });
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const CreateNewTaskWidget(),
          ],
        ),
      ),
    );
  }
}
