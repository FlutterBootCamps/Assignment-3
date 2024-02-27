import 'package:assignment_3/model/task_model.dart';
import 'package:get_storage/get_storage.dart';

class DataServices {
  List<TaskModel> taskList = [];
  List<int> completeList = [];
  final box = GetStorage();

  void addTask(String task) {
    taskList.add(TaskModel(title: task));
    setData();
  }

  void completeTask(int index) {
    taskList[index].isComplete = true;
    if (!completeList.contains(index)) {
      completeList.add(index);
    }
    setData();
  }

  void deleteTask(int index) {
    if (completeList.contains(index)) {
      completeList.remove(index);
    }
    taskList.remove(taskList[index]);
    setData();
  }

  void deleteAllTask() {
    taskList.clear();
    completeList.clear();
    setData();
  }

  setData() async {
    final tasks = taskList.map((e) => e.toJson()).toList();
    await box.write("tasks", tasks);

    await box.write("completed", completeList);

    box.save();
  }

  loadData() {
    taskList = (box.read("tasks") as List<dynamic>)
        .map((e) => TaskModel.fromJson(e))
        .toList();

    completeList =
        (box.read("completed") as List<dynamic>).map((e) => e as int).toList();
  }
}
