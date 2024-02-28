import 'dart:convert';

import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/service/setup.dart';

class DataService {
  List<TodoTask> todoList = [];

// to add the task to list
  void addTask(TodoTask task) {
    todoList.add(task);
    ubdateTask();
  }

// to delete spercific task
  void deleteTask(TodoTask task) {
    todoList.remove(task);
    ubdateTask();
  }

//to delete all items in list
  void deletAllItems() {
    todoList.clear();
    ubdateTask();
  }

// to reverse the value of is done
  void doneTask(TodoTask task) {
    task.isDone = !task.isDone;
    ubdateTask();
  }

// to return completed list
  List<TodoTask> completedList() {
    List<TodoTask> newList = [];
    for (TodoTask newTask in todoList) {
      if (newTask.isDone) {
        newList.add(newTask);
      }
    }
    return newList;
  }

  void ubdateTask() {
    List<String> allTasks =
        todoList.map((task) => json.encode(task.toMap())).toList();
    prefs?.setStringList("task", allTasks);
  }

  getAllTasks() {
    List<String>? allTasksString = prefs?.getStringList("task");

    if (allTasksString != null) {
      todoList = [
        for (String task in allTasksString) TodoTask.fromJson(json.decode(task))
      ];
      print(todoList);
    }
  }
}
