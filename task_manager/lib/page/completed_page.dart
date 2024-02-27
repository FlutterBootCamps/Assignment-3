import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_maneger_bloc.dart';
import 'package:task_manager/component/customText.dart';
import 'package:task_manager/component/row_task.dart';

import '../const/const_color.dart';

class completedPage extends StatelessWidget {
  const completedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskManegerBloc = BlocProvider.of<TaskManegerBloc>(context);
    taskManegerBloc.add(LoadTask());

    return Scaffold(
      appBar: AppBar(actions: [
        CustomText(
            text: 'John',
            color: ColorText,
            fontSize: 18,
            fontWeight: FontWeight.w600),
        Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(shape: BoxShape.circle),
            height: 42,
            width: 42,
            child: Image.asset("assets/image/pexels-pixabay-220453 1.png"))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          BlocBuilder<TaskManegerBloc, TaskManegerState>(
            builder: (context, state) {
              if (state is LoadState) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) =>
                        state.tasks[index].isDone == true
                            ? RowTask(task: state.tasks[index])
                            : Center(
                                child: Column(children: [
                                  Image.asset(
                                      "assets/image/undraw_no_data_re_kwbl 1.png"),
                                  CustomText(
                                      text: "not complete",
                                      color: ColorSubText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)
                                ]),
                              ));
              } else {
                return Center(
                  child: Column(children: [
                    Image.asset("assets/image/undraw_no_data_re_kwbl 1.png"),
                    CustomText(
                        text: "not complete",
                        color: ColorSubText,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)
                  ]),
                );
              }
            },
          ),
        ]),
      ),
    );
  }
}
