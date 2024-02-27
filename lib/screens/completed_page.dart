import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_task_manager/bloc/task_bloc.dart';
import 'package:tasky_task_manager/data_layer/home_data_layer.dart';
import 'package:tasky_task_manager/helpers/extensions/screen_helper.dart';
import 'package:tasky_task_manager/utils/colors.dart';
import 'package:tasky_task_manager/utils/fonts.dart';
import 'package:tasky_task_manager/widgets/image_text_container.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TaskBloc>().add(ShowCompletedListEvent());
    return Scaffold(
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
      body: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is CompletedTaskState) {
            if (!state.isHomePage) {
              context.showErrorSnackBar(context, state.msg);
            }
          }
        },
        builder: (context, state) {
          if (state is CompletedListShownState &&
              locator.getAllCompleteTasks().isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  const SizedBox(
                    height: 132,
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: state.listOfTasks,
                  ),
                ],
              ),
            );
          }else if (state is CompletedTaskState  &&
              locator.getAllCompleteTasks().isNotEmpty){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  const SizedBox(
                    height: 132,
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: state.listOfTasks,
                  ),
                ],
              ),
            );
          }
          return const ImageTextContainer(
            image: "assets/images/clippers.png",
            text: "not complete",
          );
        },
      ),
    );
  }
}
