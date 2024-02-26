import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky_task_manager/bloc/task_bloc.dart';
import 'package:tasky_task_manager/data_layer/home_data_layer.dart';
import 'package:tasky_task_manager/helpers/extensions/screen_helper.dart';
import 'package:tasky_task_manager/utils/colors.dart';
import 'package:tasky_task_manager/utils/fonts.dart';
import 'package:tasky_task_manager/widgets/main_info_header.dart';
import 'package:tasky_task_manager/widgets/task_add_bottom_sheet.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<HomeData>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation:
            0, // To stop the appbar from weirdly elevating and changing color when scrolling the task list.
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
              BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  return MainInfoHeader(
                    name: "John",
                    numOfTasks: locator.taskList.length,
                    onTap: () {},
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: context.getWidth(context),
                height: context.getHeight(context) * .68,
                child: BlocConsumer<TaskBloc, TaskState>(
                  listener: (context, state) {
                    if (state is TaskAddErrorState){
                      Navigator.pop(context);
                      context.showErrorSnackBar(context, state.msg);
                    }else if (state is AddedTaskState){
                      context.showSuccessSnackBar(context, state.msg);
                    }
                  },
                  builder: (context, state) {
                    if (state is AddedTaskState) {
                      return ListView(
                          children: locator.getAllIncompleteTasks());
                    } else {
                      return ListView(
                          children: locator.getAllIncompleteTasks());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            showModalBottomSheet(
              barrierColor: noColor,
              context: context,
              builder: (context) {
                return TaskAddBottomSheet(
                  noteController: noteController,
                  onPreseed: () {
                    context
                        .read<TaskBloc>()
                        .add(AddTaskEvent(taskText: noteController.text));
                        noteController.clear();
                        
                  },
                );
              },
            );
          },
          icon: Image.asset("assets/icons/add_button.png")),
    );
  }
}
