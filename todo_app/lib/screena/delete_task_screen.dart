import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task_bloc.dart';
import 'package:todo_app/constant/color.dart';
import 'package:todo_app/constant/space.dart';
import 'package:todo_app/data_layer/data_service.dart';
import 'package:todo_app/service/setup.dart';
import 'package:todo_app/widgets/delete_task_widget.dart';

class DeleteScreen extends StatelessWidget {
  const DeleteScreen({super.key});

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
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                    Icons.arrow_back_ios),), 
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "John",
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
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
                          const Text(
                            "Delete Tasks ",
                            style: TextStyle(
                                color: black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              bloc.add(DeleteAllTask());
                            },
                            child: const Text(
                              "Delete all",
                              style: TextStyle(
                                  color: red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
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
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: serviceLocator.allTask.length,
                                itemBuilder: (context, index) {
                                  return 
                                  DeleteTaskWidget(
                                    idTask: serviceLocator.allTask[index],
                                  );
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
          ],
        ),
      ),
    );
  }
}
