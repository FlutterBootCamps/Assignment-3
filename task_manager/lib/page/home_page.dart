import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:task_manager/bloc/task_maneger_bloc.dart';
import 'package:task_manager/component/customText.dart';
import 'package:task_manager/component/row_task.dart';
import 'package:task_manager/const/const_color.dart';
import 'package:task_manager/data_layer/data_layer.dart';

import 'delete_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textTitle = TextEditingController();
    final GetItem = GetIt.I.get<TaskMangerGetStorge>();

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
            decoration: const BoxDecoration(shape: BoxShape.circle),
            height: 42,
            width: 42,
            child: Image.asset("assets/image/pexels-pixabay-220453 1.png"))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                CustomText(
                    text: 'Welcome, ',
                    color: ColorText,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                CustomText(
                    text: 'John',
                    color: selectColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                CustomText(
                    text: '.',
                    color: ColorText,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)
              ],
            ),
       InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => TaskManegerBloc(),lazy: true,
          child: const DeletePage(),
        ),
      ),
    );
  },
  child: SvgPicture.asset("assets/icon/Group.svg", color: unselectColor),
)
]),
           BlocBuilder<TaskManegerBloc, TaskManegerState>(
            builder: (context, state) {
                if (state is LoadState) {
             return CustomText(
                text: 'You’ve got ${GetItem.countUncompletedTask()} tasks to do.',
                color: ColorSubText,
                fontSize: 16,
                fontWeight: FontWeight.w400);}
                else {
                  return CustomText(
                text: 'You’ve got ${GetItem.countUncompletedTask()} tasks to do.',
                color: ColorSubText,
                fontSize: 16,
                fontWeight: FontWeight.w400);
                }}),
          const SizedBox(height: 20),
          Center(
            child: BlocBuilder<TaskManegerBloc, TaskManegerState>(
              builder: (context, state) {
                if (state is LoadState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) =>
                        state.tasks[index].isDone == false
                            ? RowTask(task: state.tasks[index])
                            : Container(),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        shape: const CircleBorder(eccentricity: 1),
        onPressed: () {
          showBottomSheet(
            builder: (context) {
              return Container(
                height: 300,
                color: Colors.white,
                child: Center(
                  child: Column(children: [
                    TextField(
                      controller: textTitle,
                      decoration: InputDecoration(
                          prefix:
                              SvgPicture.asset("assets/icon/leading icon.svg"),
                          hintText: "Add a note..."),
                    ),
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<TaskManegerBloc>(context)
                              .add(AddTask(textTitle.text));
                          Navigator.pop(context);
                          textTitle.clear();
                        },
                        child: const Text("create"))
                  ]),
                ),
              );
            },
            context: context,
          );
        },
        child: SvgPicture.asset("assets/icon/Vector.svg", fit: BoxFit.fill),
      ),
    );
  }
}
