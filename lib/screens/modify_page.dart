import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_task_manager/bloc/task_bloc.dart';
import 'package:tasky_task_manager/data_layer/home_data_layer.dart';
import 'package:tasky_task_manager/helpers/extensions/screen_helper.dart';
import 'package:tasky_task_manager/utils/colors.dart';
import 'package:tasky_task_manager/utils/fonts.dart';

class ModifyPage extends StatelessWidget {
  const ModifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        scrolledUnderElevation:
            0, // To stop the appbar from weirdly elevating and changing color when scrolling the task list.
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset("assets/icons/arrow_back.png"),
        ),
        actions: const [
          Text(
            "John",
            style: TextStyle(
                color: slatePurple,
                fontFamily: urbanistFont,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14,
              right: 26,
            ),
            child: CircleAvatar(
              radius: 26.25,
              backgroundImage: AssetImage("assets/images/john.png"),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Delete Tasks",
                    style: TextStyle(
                        color: slatePurple,
                        fontFamily: urbanistFont,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        context.read<TaskBloc>().add(DeleteAllTasksEvent());
                      },
                      child: const Text(
                        "Delete All",
                        style: TextStyle(
                            color: redColor,
                            fontFamily: urbanistFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
              const SizedBox(
                height: 59,
              ),
              BlocConsumer<TaskBloc, TaskState>(
                listener: (context, state) {
                  if (state is CompletedTaskState) {
                    if(!state.isHomePage){
                    context.showSuccessSnackBar(context, state.msg);
                    }
                  }else if (state is DeleteTaskState){
                    context.showErrorSnackBar(context, state.msg);
                  }else if (state is DeleteAllTasksState){
                    context.showErrorSnackBar(context, state.msg);
                  }else if (state is EditTaskState){
                    context.showSuccessSnackBar(context, state.msg);
                  }else if (state is TaskEditErrorState){
                    context.showErrorSnackBar(context, state.msg);
                  }
                },
                builder: (context, state) {
                  if (state is DeleteTaskState){
                    return ListView(
                    shrinkWrap: true,
                    children: state.listOfTasks,
                  );
                  } else if (state is DeleteAllTasksState){
                    return ListView(
                    shrinkWrap: true,
                    children: state.listOfTasks,
                  );

                  }
                  return ListView(
                    shrinkWrap: true,
                    children: locator.getAllIncompleteTasks(isEditing: true),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
