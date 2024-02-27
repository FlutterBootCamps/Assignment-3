import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasky_task_manager/models/task_model.dart';
import 'package:tasky_task_manager/screens/completed_page.dart';
import 'package:tasky_task_manager/screens/home_page.dart';
import 'package:tasky_task_manager/widgets/task_card.dart';

class HomeData {

  HomeData(){
    loadTasksFromStorage();
  }

  int currentPageIndex = 0;
  List<Widget> screens = [
    HomePage(),
    const CompletedPage(),
  ];

  List<Task> taskList = [];

  String addTask(String text) {
    if (taskList
        .any((element) => element.task.toLowerCase() == text.toLowerCase())) {
      return "This task already exists, please try again!";
    } else if (text.isEmpty) {
      return "Task Field can't be empty!";
    }
    taskList.add(Task(task: text, isCompleted: false));
    uploadTasksToStorage();
    return "";
  }

  void removeTask(Task task) {
    taskList.removeWhere((element) => element.task == task.task);
    uploadTasksToStorage();
  }

  bool removeAllTasks() {
    if (taskList.isNotEmpty && taskList.any((element) => !element.isCompleted)) {
      taskList.removeWhere((element) => !element.isCompleted);
      uploadTasksToStorage();
      return true;
    }
    return false;
  }

  void completeTask(Task task) {
    taskList.firstWhere((element) => element.task == task.task).isCompleted =
        !task.isCompleted;
        uploadTasksToStorage();
  }

  List<Widget> getAllIncompleteTasks({bool? isEditing = false}) {
    List<Widget> filteredList = [];
    for (var element in taskList) {
      if (!element.isCompleted) {
        filteredList.add(TaskCard(task: element, isEditing: isEditing,));
      }
    }
    return filteredList;
  }
  List<Widget> getAllCompleteTasks({bool? isEditing = false}){
    List<Widget> filteredList = [];
    for (var element in taskList) {
      if (element.isCompleted) {
        filteredList.add(TaskCard(task: element, isEditing: isEditing,));
      }
    }
    return filteredList;
  }

  String editTask(String text, Task task){
    if (taskList
        .any((element) => element.task.toLowerCase() == text.toLowerCase())) {
      return "This task already exists, please try again!";
    } else if (text.isEmpty) {
      return "Task Field can't be empty!";
    }
    taskList.firstWhere((element) => task.task == element.task).task = text;
    uploadTasksToStorage();
    return "";
  }

  void loadTasksFromStorage() {
    taskList = (box.read<List<dynamic>>("taskList") ?? [])
        .map((e) => Task.fromJson(e))
        .toList();
  }

  void uploadTasksToStorage() {
    box.write("taskList", taskList.map((e) => e.toJson()).toList());
  }
}

final locator = GetIt.I.get<HomeData>();

final box = GetStorage();