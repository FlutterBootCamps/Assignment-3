import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task_bloc.dart';
import 'package:todo_app/constant/color.dart';
import 'package:todo_app/constant/space.dart';
import 'package:todo_app/data_layer/data_service.dart';
import 'package:todo_app/helper/extention.dart';
import 'package:todo_app/service/setup.dart';

class CreateNewTaskWidget extends StatelessWidget {
  const CreateNewTaskWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    final bloc = BlocProvider.of<TaskBloc>(context);

    final serviceLocator = locator.get<DataService>();

    TextEditingController titleController = TextEditingController();


    return  Positioned(
              bottom: 35,
              right: 26,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 60),
                          child: Center(
                            child: SizedBox(
                              width: context.getWidth() * 0.7,
                              child: Column(
                                children: [
                                  TextField(
                                    controller: titleController,
                                    decoration: const InputDecoration(
                                      hintText: "Add a note...",
                                      hintStyle: TextStyle(
                                          color: lightGrey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                      prefixIcon: Icon(
                                        Icons.edit,
                                        color: lightGrey,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  height24,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // var titleController;
                                          if (titleController.text.isNotEmpty) {
                                            bloc.add(CreateNewTask(
                                                title: titleController.text));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    "Create Task Successfully"),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    "Enter valid title, can't make it empty"),
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text(
                                          "Create",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: blue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      );
                },
                child: Container(
                  width: context.getWidth() * 0.15,
                  height: context.getWidth() * 0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: black,
                    border: Border.all(color: white, width: 2),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 50,
                    color: white,
                  ),
                ),
              
              ),
            )
          ;
  }
}