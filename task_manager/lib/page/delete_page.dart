import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:task_manager/bloc/task_maneger_bloc.dart';
import 'package:task_manager/component/customText.dart';
import 'package:task_manager/component/row_task.dart';
import 'package:task_manager/const/const_color.dart';
import 'package:task_manager/data_layer/data_layer.dart';


class DeletePage extends StatelessWidget {
  const DeletePage({super.key});

  @override
  Widget build(BuildContext context) {
      final GetItem = GetIt.I.get<TaskMangerGetStorge>();

    final taskManegerBloc = BlocProvider.of<TaskManegerBloc>(context);
    taskManegerBloc.add(LoadTask());
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomText(
            text: 'John',
            color: ColorText,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(shape: BoxShape.circle),
            height: 42,
            width: 42,
            child: Image.asset("assets/image/pexels-pixabay-220453 1.png"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Delete Tasks',
                  color: ColorText,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                CustomText(
                  text: 'Delete all',
                  color: deleteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            BlocBuilder<TaskManegerBloc, TaskManegerState>(
              builder: (context, state) {
                print(state);
                if (state is LoadState) {
                  return ListView.builder(
                    shrinkWrap: false,
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) =>
                        state.tasks[index].isDone == false
                            ? RowTask(
                                task: state.tasks[index], isDelete: true)
                            : Container(),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
