import 'package:flutter/material.dart';
import 'package:tasky_task_manager/models/task_model.dart';
import 'package:tasky_task_manager/screens/completed_page.dart';
import 'package:tasky_task_manager/screens/home_page.dart';
import 'package:tasky_task_manager/widgets/task_card.dart';

class HomeData {
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
    return "";
  }

  void removeTask(Task task) {
    taskList.removeWhere((element) => element.task == task.task);
  }

  bool removeAllTasks() {
    if (taskList.isNotEmpty) {
      taskList.clear();
      return true;
    }
    return false;
  }

  void completeTask(Task task) {
    taskList.firstWhere((element) => element.task == task.task).isCompleted =
        !task.isCompleted;
  }

  List<Widget> getAllIncompleteTasks() {
    List<Widget> filteredList = [];
    for (var element in taskList) {
      if (!element.isCompleted) {
        filteredList.add(TaskCard(task: element));
      }
    }
    return filteredList;
  }
  List<Widget> getAllCompleteTasks(){
    List<Widget> filteredList = [];
    for (var element in taskList) {
      if (element.isCompleted) {
        filteredList.add(TaskCard(task: element));
      }
    }
    return filteredList;
  }
}
