import 'dart:convert';

import 'package:assignment_3/data/task_model.dart';
import 'package:get_storage/get_storage.dart';

class TaskData {
  List<TasksModel> tasks = [];
  List<TasksModel> completedTasks = [];

  final storage = GetStorage();

  TaskData() {
    getAllTasks();
  }

  getAllTasks() {
    if (storage.hasData("tasks")) {
      final reedingList = jsonDecode(storage.read("tasks"));
      for (var element in reedingList) {
        tasks.add(TasksModel.fromJson(element));
      }
    }
    if (storage.hasData("completedTasks")) {
      final reedingList = jsonDecode(storage.read("completedTasks"));
      for (var element in reedingList) {
        completedTasks.add(TasksModel.fromJson(element));
      }
    }
  }

  addToCompletedTasks({required TasksModel task}) async {
    completedTasks.add(task);
    tasks.remove(task);
    List taskModelMap = [];
    for (var element in tasks) {
      taskModelMap.add(element.toJson());
    }
    await storage.write("tasks", jsonEncode(taskModelMap));
    List completedTaskModelMap = [];
    for (var element in completedTasks) {
      completedTaskModelMap.add(element.toJson());
    }
    await storage.write("completedTasks", jsonEncode(completedTaskModelMap));
  }

  addToTasks({required TasksModel task}) async {
    tasks.add(task);
    List taskModelMap = [];
    for (var element in tasks) {
      taskModelMap.add(element.toJson());
    }
    await storage.write("tasks", jsonEncode(taskModelMap));
  }

  addToTasksFromCompleted({required TasksModel task}) async {
    tasks.add(task);
    completedTasks.remove(task);
    List taskModelMap = [];
    for (var element in tasks) {
      taskModelMap.add(element.toJson());
    }
    await storage.write("tasks", jsonEncode(taskModelMap));
    List completedTaskModelMap = [];
    for (var element in completedTasks) {
      completedTaskModelMap.add(element.toJson());
    }
    await storage.write("completedTasks", jsonEncode(completedTaskModelMap));
  }

  deleteTask({required TasksModel task}) async {
    if (tasks.contains(task)) {
      tasks.remove(task);
      await storage.remove("tasks");
      List taskModelMap = [];
      for (var element in tasks) {
        taskModelMap.add(element.toJson());
      }
      await storage.write("tasks", jsonEncode(taskModelMap));
    }
    else if (completedTasks.contains(task)) {
      completedTasks.remove(task);
      await storage.remove("completedTasks");
      List taskModelMap = [];
      for (var element in completedTasks) {
        taskModelMap.add(element.toJson());
      }
      await storage.write("completedTasks", jsonEncode(taskModelMap));
    }
  }

  deleteAllTasks() async {
    tasks = [];
    await storage.remove("tasks");
  }
}
